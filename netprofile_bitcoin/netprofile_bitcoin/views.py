#!/usr/bin/env python
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-
#
# NetProfile:  Bitcoin module - Views
# © Copyright 2013-2014 Alex 'Unik' Unigovsky
#
# This file is part of NetProfile.
# NetProfile is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public
# License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later
# version.
#
# NetProfile is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General
# Public License along with NetProfile. If not, see
# <http://www.gnu.org/licenses/>.

from __future__ import (
	unicode_literals,
	print_function,
	absolute_import,
	division
)

from pyramid.i18n import (
	TranslationStringFactory,
	get_localizer
)

#from here, there are several methods added
#that are not in the original lib
#https://github.com/nikitos/bitcoin-python
import bitcoinrpc
from decimal import Decimal

from pyramid.view import view_config
from pyramid.httpexceptions import (
	HTTPForbidden,
	HTTPSeeOther
)
from sqlalchemy import func
from sqlalchemy.orm.exc import NoResultFound

from netprofile.common.factory import RootFactory
from netprofile.common.hooks import register_hook
from netprofile.db.connection import DBSession

from netprofile_access.models import AccessEntity,AccessEntityLink

from netprofile_bitcoin.check_input_fields import not_empty_int, not_empty_float,not_empty_str,string_wallet_name 

_ = TranslationStringFactory('netprofile_bitcoin')

@view_config(
	route_name='bitcoin.cl.export',
	permission='USAGE',
	renderer='json'
)
def export_key(request):
	cfg = request.registry.settings
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)
	resp = {'privkey': None}
	addr = request.GET.get('addr', None)
	if addr:
		resp['privkey'] = bitcoind.dumpprivkey(addr)
	return resp


@view_config(
	route_name='bitcoin.cl.create_wallet',
	permission='USAGE',
	renderer='json'
)
def create_wallet(request):
	loc = get_localizer(request)
	cfg = request.registry.settings
	sess = DBSession()
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)

	wallets = [bitcoind.getaccount(link.value).encode('latin1').decode('utf8')
			   for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)]

	resp = {'success_create':None,
			'error_submitting_form':None,                   
			'error_wallet_name_field':None,
			'error_not_unique_name':None} 

	csrf = request.POST.get('csrf', '')
	if csrf == request.get_csrf():
		newwallet_create = string_wallet_name(request.POST.get("newwallet_create",''))

		if newwallet_create:

			for wallet in wallets:     
				if newwallet_create == wallet:
					resp['error_not_unique_name']=loc.translate(_("Error. Wallet with the same name already exists."))
					return resp
		
			new_wallet=bitcoind.getnewaddress(newwallet_create)
			link = AccessEntityLink()
			link.value=new_wallet
			link.account_name=newwallet_create
			link.entity=access_user
			link.type_id = int(bitcoin_link_id) 

			resp['success_create']= loc.translate(_("New wallet successful created"))
			return resp
		else:
			resp['error_wallet_name_field']=loc.translate(_("Error in the field 'Wallet name'"))
			return resp
	else:
		resp['error_submitting_form']=loc.translate(_('Error submitting form'))
		return resp
		

@view_config(
	route_name='bitcoin.cl.create_wallet_from_import',
	permission='USAGE',
	renderer='json'
)
def create_wallet_from_import(request):
	loc = get_localizer(request)
	cfg = request.registry.settings
	sess = DBSession()
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()	
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)	
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)

	wallets = [bitcoind.getaccount(link.value).encode('latin1').decode('utf8')
			   for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)]

	resp = {'success_create': None,
			'error_submitting_form':None,
			'error_import_key':None,
			'error_wallet_name_field':None,
			'error_not_unique_name':None}	

	csrf = request.POST.get('csrf', '')   
	if csrf == request.get_csrf():
		newwallet_create_from_import = string_wallet_name(request.POST.get("newwallet_create_from_import",''))
		privkey=not_empty_str(request.POST.get('privkey',''))

		if privkey==False:
			resp['error_import_key']=loc.translate(_("Error in the field 'Private Key'"))
			return resp 

		if len(newwallet_create_from_import)==0:
			resp['error_wallet_name_field']=loc.translate(_("Error in the field 'Wallet name'"))
			return resp 

		for wallet in wallets:     
			if newwallet_create_from_import == wallet:
				resp['error_not_unique_name']=loc.translate(_("Error. Wallet with the same name already exists."))
				return resp

		create_from_import = bitcoind.importprivkey(privkey,newwallet_create_from_import)
		link = AccessEntityLink()
		link.value=bitcoind.getaccountaddress(newwallet_create_from_import)
		link.account_name= newwallet_create_from_import
		link.entity=access_user		 
		link.type_id = int(bitcoin_link_id)

		resp['success_create']=loc.translate(_("New wallet successful created"))		  
		return resp				
	else:
		resp['error_submitting_form']=loc.translate(_('Error submitting form'))
		return resp


@view_config(
	route_name='bitcoin.cl.wallet',
	permission='USAGE',
	renderer='netprofile_bitcoin:templates/client_bitcoin.mak'
)
def bitcoin_walletss(request):
	loc = get_localizer(request)
	cfg = request.registry.settings
	sess = DBSession()
	tpldef = {}
	request.run_hook('access.cl.tpldef', tpldef, request)
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()

	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)
	bitcoin_importkey=cfg.get('netprofile.client.bitcoin.importkey')
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)
	  
	def address_list(address_from_db):
		wallet=bitcoind.getaccount(address_from_db).encode('latin1').decode('utf8')
		return bitcoind.getaddressesbyaccount(wallet) 

	userwallets = []    
	userwallets = [{'wallet':link.account_name,
					 #'wallet':bitcoind.getaccount(link.value).encode('latin1').decode('utf8'), 
					'balance':"{0}".format(str(bitcoind.getbalance(bitcoind.getaccount(link.value).encode('latin1').decode('utf8') ))),
					'addresses':address_list(link.value),
					#'type_addresses':type(address_list(link.value)),
					'address_from_db':link.value} 
					for link in access_user.links 
					if int(link.type_id)==int(bitcoin_link_id)]

	tpldef.update({'wallets':userwallets})

	total_balance=Decimal('0')
	if len(userwallets) > 0:
		total_balance =sum([bitcoind.getbalance( bitcoind.getaccount(link.value).encode('latin1').decode('utf8') )
							for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)])
		
		tpldef['total_balance']=str(total_balance)
	else:
		tpldef['total_balance']=str(total_balance)

	if bitcoin_importkey=='true':
		tpldef['bitcoin_importkey']='true'
	else:
		tpldef['bitcoin_importkey']='false'
		
	return tpldef


@register_hook('access.cl.menu')
def _gen_menu(menu, req):
	loc = get_localizer(req)
	menu.append({'route' : 'bitcoin.cl.wallet',
				 'text'  : loc.translate(_('Bitcoin Wallets'))
			   })


@view_config(
	route_name='bitcoin.cl.move',
	permission='USAGE',
	renderer='json'
)
def move_coints(request):
	loc = get_localizer(request)    
	cfg = request.registry.settings
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)
	
	res={'error_аmount':None,
		 'error_submitting_form':None,
		 'error_аmount_zero':None,
		 'error_accounts':None,
		 'success':None}

	csrf = request.POST.get('csrf', '')
	fromaccount = request.POST.get('fromaccount', None)
	toaccount = request.POST.get('toaccount', None)
	if not_empty_float(request.POST.get('аmount', ''))==False:
		res['error_аmount']=loc.translate(_("Error in the field 'Аmount of transfer'"))
		return res
	else:
		amount=Decimal(not_empty_float(request.POST.get('аmount', '')))
	if amount==0:
		res['error_аmount_zero']=loc.translate(_("Error. You entered zero."))
		return res
	if csrf == request.get_csrf(): 
		if fromaccount and toaccount :
			transfer=bitcoind.move(fromaccount,toaccount,amount)
			res['success']=loc.translate(_("Money transfer has been successful"))
			return res
		else:
			res['error_accounts']=loc.translate(_("Error in one of the wallet name fields"))  
			return res		 	
	else:
		res['error_submitting_form']=loc.translate(_('Error submitting form'))
		return res


@view_config(
	route_name='bitcoin.cl.send',
	permission='USAGE',
	renderer='json'
)    
def send_coints(request):
	loc = get_localizer(request)
	sess = DBSession()
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()	
	cfg = request.registry.settings
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)	
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)

	addresses = [link.value for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)]

	res={'error_аmount':None,
		 'error_submitting_form':None,
		 'error_аmount_zero':None,
		 'error_amount_too_small':None,
		 'error_fromaccount':None,
		 'error_tobitcoinaddress':None,
		 'error_use_other_option':None,
		 'success':None}

	comment = request.POST.get('comment','')
	if len(comment)==0:
		comment=loc.translate(_("No comments"))

	comment_to = request.POST.get('comment_to','')
	if len(comment_to)==0:
		comment_to=loc.translate(_("No comments"))

	fromaccount=request.POST.get('fromaccount','')
	if len(fromaccount)==0:
		res['error_fromaccount']=loc.translate(_("Error in the sender wallet"))
		return res 

	if not_empty_str(request.POST.get('tobitcoinaddress',''))==False:
		res['error_tobitcoinaddress']=loc.translate(_("Error in the field 'Bitcoin address to send to'"))
		return res 
	else:
		tobitcoinaddress=request.POST.get('tobitcoinaddress','')

	for address in addresses:     
		if tobitcoinaddress == address:
			res['error_use_other_option']='error_use_other_option'
			return res

	if not_empty_float(request.POST.get('send_amount', ''))==False:
		res['error_аmount']= loc.translate(_("Error in the field 'Amount to send'"))
		return res
	else:
		amount=Decimal(not_empty_float(request.POST.get('send_amount', '')))
	if amount==0:
		res['error_аmount_zero']=loc.translate(_("Error. You entered zero."))
		return res
	if amount<Decimal('0.0001'):
		res['error_amount_too_small']=loc.translate(_("Error. Amount is less than the typical transaction fee (0.0001 BTC)."))
		return res

	csrf = request.POST.get('csrf', '')
	if csrf == request.get_csrf(): 
		send_success=bitcoind.sendfrom(fromaccount,tobitcoinaddress,amount,comment=comment,comment_to=comment_to)
		res['success']= loc.translate(_("Sending money has been successful"))
		return res
	else:
		res['error_submitting_form']=loc.translate(_("Error submitting form"))
		return res


@view_config(
	route_name='bitcoin.cl.change_name',
	permission='USAGE',
	renderer='json'
)
def change_name_wallet(request):
	loc = get_localizer(request) 
	sess = DBSession()
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()	
	cfg = request.registry.settings
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)	
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)

	wallets = [link.account_name
			   for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)]
	
	res={'error_submitting_form':None,
		 'old_account_error':None,
		 'new_account_error':None,
		 'success_change':None,
		 'error_not_unique_name':None}

	csrf = request.POST.get('csrf', '')
	if csrf == request.get_csrf():  
		old_account = request.POST.get('old_account', '')
		new_account = string_wallet_name(request.POST.get('new_account', ''))
		#old_account_balance=bitcoind.getbalance(old_account)

		if len(old_account)==0:
			res['old_account_error']=loc.translate(_("Error in the field 'Old wallet name'"))
			return res 			
		
		if len(new_account)==0:
			res['old_account_error']=loc.translate(_("Error in the field 'New wallet name'"))
			return res 			

		for wallet in wallets:     
			if  new_account == wallet:
				res['error_not_unique_name']=loc.translate(_("Error. Wallet with the same name already exists."))
				return res

		#entry_in_db=access_user.links
		#entry_in_db.filter_by(account_name=str(old_account)).first().account_name=new_account
		#entry_in_db.account_name=new_account
		entry_in_db=[link for link in access_user.links 
					 if str(link.account_name)==old_account and int(link.type_id)==int(bitcoin_link_id)]
		entry_in_db[0].account_name=new_account

		res['success_change']=loc.translate(_("Change the wallet name has been successful"))
		return res

	else:
		res['error_submitting_form']=loc.translate(_('Error submitting form'))
		return res


@view_config(
	route_name='bitcoin.cl.listtrans',
	permission='USAGE',
	renderer='netprofile_bitcoin:templates/client_bitcoin_listtrans.mak'
)
def transaction_list(request):
	loc = get_localizer(request)
	sess = DBSession()
	access_user = sess.query(AccessEntity).filter_by(nick=str(request.user)).first()  
	cfg = request.registry.settings
	bitcoind_host = cfg.get('netprofile.client.bitcoind.host')
	bitcoind_port = cfg.get('netprofile.client.bitcoind.port')
	bitcoind_login = cfg.get('netprofile.client.bitcoind.login')
	bitcoind_password = cfg.get('netprofile.client.bitcoind.password')
	bitcoin_link_id=cfg.get('netprofile.client.bitcoin.link_id', 1)	
	bitcoind = bitcoinrpc.connect_to_remote(bitcoind_login, bitcoind_password, host=bitcoind_host, port=bitcoind_port)
	
	No_data=loc.translate(_("For this category of transactions, this information is not available"))

	def comment_in_move(transaction,No_data):
		if transaction.category =='move':
			return No_data
		else:
			return getattr(transaction,'comment',No_data).encode('latin1').decode('utf8')


	tpldef = {'transaction_account':None,
			  'transaction_list':None,
			  'error_number':None,
			  'error_number_field':None,
			  'empty_list_transaction':None,
			  'error_number_and_empty_list_transaction':None} 

	request.run_hook('access.cl.tpldef', tpldef, request)

	userwallets = [{'wallet':bitcoind.getaccount(link.value).encode('latin1').decode('utf8')} for link in access_user.links if int(link.type_id)==int(bitcoin_link_id)]
	tpldef['wallets']=userwallets
	
	csrf = request.POST.get('csrf', '')
	account_of_wallet = request.POST.get('account_of_wallet', '')
	tpldef['transaction_account']=account_of_wallet 
	number=request.POST.get('number', '')   
	if not_empty_int(number):
		number = int(number)
		if csrf == request.get_csrf():
			transaction_list=bitcoind.listtransactions(account=account_of_wallet,count=number)   
			list_param_transaction=list() 
			list_param_transaction = [{'amount':transaction.amount,
									   'category':transaction.category,
									   'otheraccount':getattr(transaction,'otheraccount',No_data).encode('latin1').decode('utf8'),    
									   'address':getattr(transaction,'address',No_data),
									   'confirmations':getattr(transaction,'confirmations',No_data),
									   'txid':getattr(transaction,'txid',No_data),
									   'comment':comment_in_move(transaction,No_data),
									   'to':getattr(transaction,'to',No_data).encode('latin1').decode('utf8') } for transaction in transaction_list ]
 
			if len(list_param_transaction)>0: 
				tpldef['transaction_list']=list_param_transaction

			if len(list_param_transaction)==0 and number>0:
				tpldef['empty_list_transaction']=True  

			if len(list_param_transaction)==0 and number==0:    
				tpldef['error_number_and_empty_list_transaction']=True
				if bitcoind.listtransactions(account=account_of_wallet,count=1):                        
					tpldef['error_number_and_empty_list_transaction']=None
					tpldef['error_number']=True

		return tpldef 

	else:
		tpldef['error_number_field']=True
		return tpldef
