## -*- coding: utf-8 -*-
<%inherit file="netprofile_access:templates/client_layout.mak"/>
<script type='text/javascript'>
function createWallet(result_id, form_id, url) {
        jQuery.ajax({
              url:     url,
              type:     "POST",
              dataType: "JSON",
              data: jQuery("#"+form_id).serialize(), 
              beforeSend: function () {
              document.getElementById(result_id).innerHTML = "${loc.translate(_("Creating new wallet..."))}";},

              success: function(response) {                                     
              if (response['error_submitting_form']) 
                 {document.getElementById(result_id).innerHTML =response['error_submitting_form'];
                  setTimeout(function() {location.reload();}, 3000);}
        
              if (response['error_wallet_name_field']) 
                 {document.getElementById(result_id).innerHTML =response['error_wallet_name_field'];
                  setTimeout(function() {location.reload();}, 3000);}

              if (response['error_not_unique_name']) 
                 {document.getElementById(result_id).innerHTML =response['error_not_unique_name'];
                  setTimeout(function() {location.reload();}, 3000);}

              if (response['success_create']) 
                 {document.getElementById(result_id).innerHTML =response['success_create'];
                  location.reload();}               
              },
              error: function(response) { 
                     document.getElementById(result_id).innerHTML = "${loc.translate(_("Server connection error"))}";
                     setTimeout(function() {location.reload();}, 3000);}
            });
      }
</script>

<script type='text/javascript'>
function exportPrivKey(addrid, url, resultid) {
        jQuery.ajax({
              url:     url,
              type:     "GET",
              dataType: "JSON",
              data: ({addr: addrid}),
              error: function (){
                     alert("${loc.translate(_("Connection error"))}");
                     setTimeout(function() {location.reload();}, 3000);},
              success: function(response){
                       document.getElementById(resultid).innerHTML = response['privkey'];}
            });
      }
</script>

<script type="text/javascript">
function importKey(result_id, form_id, url) {
        jQuery.ajax({
              url:     url,
              type:     "POST",
              dataType: "JSON",
              data: jQuery("#"+form_id).serialize(), 
              beforeSend: function () {
              document.getElementById(result_id).innerHTML = "${loc.translate(_("Creating new wallet..."))}";},

              success: function(response) {                                     
              if (response['error_submitting_form']) 
                  {document.getElementById(result_id).innerHTML =response['error_submitting_form'];
                   setTimeout(function() {location.reload();}, 3000);}

              if (response['error_wallet_name_field']) 
                 {document.getElementById(result_id).innerHTML =response['error_wallet_name_field'];
                  setTimeout(function() {location.reload();}, 3000);}
                
              if (response['error_import_key']) 
                  {document.getElementById(result_id).innerHTML =response['error_import_key'];
                   setTimeout(function() {location.reload();}, 3000);}

              if (response['error_not_unique_name']) 
                  {document.getElementById(result_id).innerHTML =response['error_not_unique_name'];
                   setTimeout(function() {location.reload();}, 3000);}

              if (response['success_create']) 
                  {document.getElementById(result_id).innerHTML =response['success_create'];
                   location.reload();}               
              },
              error: function(response) { 
                     document.getElementById(result_id).innerHTML = "${loc.translate(_("Server connection error"))}";
                     setTimeout(function() {location.reload();}, 3000);}
            });
      }
</script>

<script type="text/javascript">
function moveCoints(result_id, form_id, url) {
        jQuery.ajax({
              url:     url,
              type:     "POST",
              dataType: "JSON",
              data: jQuery("#"+form_id).serialize(), 
              beforeSend: function () {
              document.getElementById(result_id).innerHTML = "${loc.translate(_("Money transfer in process..."))}";},

              success: function(response) {
              if(response['error_submitting_form'])
                {document.getElementById(result_id).innerHTML =response['error_submitting_form'];
                 setTimeout(function() {location.reload();}, 3000);}
              
              if(response['error_аmount'])
                {document.getElementById(result_id).innerHTML =response['error_аmount'];
                 setTimeout(function() {location.reload();}, 3000);}
              
              if(response['error_аmount_zero'])
                {document.getElementById(result_id).innerHTML =response['error_аmount_zero'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_accounts'])
                {document.getElementById(result_id).innerHTML =response['error_accounts'];              
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['success'])
                {document.getElementById(result_id).innerHTML =response['success'];              
                 location.reload();}
              },
              error: function(response) { 
                     document.getElementById(result_id).innerHTML = "${loc.translate(_("Server connection error"))}";
                     setTimeout(function() {location.reload();}, 3000);}
            });
      }
</script>

<script type="text/javascript">
function sendCoints(result_id, form_id, url) {
        jQuery.ajax({
              url:     url,
              type:     "POST",
              dataType: "JSON",
              data: jQuery("#"+form_id).serialize(), 
              beforeSend: function () {
              document.getElementById(result_id).innerHTML = "${loc.translate(_("Sending money in process..."))}";},

              success: function(response) {
              if(response['error_аmount'])
               {document.getElementById(result_id).innerHTML =response['error_аmount'];
                setTimeout(function() {location.reload();}, 3000);}

              if(response['error_аmount_zero'])
                {document.getElementById(result_id).innerHTML =response['error_аmount_zero'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_amount_too_small'])
                {document.getElementById(result_id).innerHTML =response['error_amount_too_small'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_fromaccount'])
                {document.getElementById(result_id).innerHTML =response['error_fromaccount'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_tobitcoinaddress'])
                {document.getElementById(result_id).innerHTML =response['error_tobitcoinaddress'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_use_other_option'])
                {document.getElementById(result_id).innerHTML ="${loc.translate(_("This address belongs to one of your wallets."))}<br />${loc.translate(_("Use the option 'Transfer money between my wallets'."))}";
                 setTimeout(function() {location.reload();}, 4000);}                 

              if(response['error_submitting_form'])
                {document.getElementById(result_id).innerHTML =response['error_submitting_form'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['success'])
                {document.getElementById(result_id).innerHTML =response['success'];               
                 location.reload();}
              },
              error: function(response) { 
                     document.getElementById(result_id).innerHTML = "${loc.translate(_("Server connection error"))}";
                     setTimeout(function() {location.reload();}, 3000);}
            });
      }
</script>

<script type="text/javascript">
function changeNameWallet(result_id, form_id, url) {
        jQuery.ajax({
              url:     url,
              type:     "POST",
              dataType: "JSON",
              data: jQuery("#"+form_id).serialize(), 
              beforeSend: function () {
              document.getElementById(result_id).innerHTML = "${loc.translate(_("Change the wallet name in process..."))}";},

              success: function(response) {
              if(response['error_submitting_form'])
                {document.getElementById(result_id).innerHTML =response['error_submitting_form'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['old_account_error'])
                {document.getElementById(result_id).innerHTML =response['old_account_error'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['new_account_error'])
                {document.getElementById(result_id).innerHTML =response['new_account_error'];
                 setTimeout(function() {location.reload();}, 3000);}

              if(response['error_not_unique_name'])
                {document.getElementById(result_id).innerHTML =response['error_not_unique_name'];
                 setTimeout(function() {location.reload();}, 3000);}
              
              if(response['success_change'])
                {document.getElementById(result_id).innerHTML =response['success_change'];             
                 location.reload();}
              },
              error: function(response) { 
                     document.getElementById(result_id).innerHTML = "${loc.translate(_("Server connection error"))}";
                     setTimeout(function() {location.reload();}, 3000);}
            });
      }
</script>

% if message:
<div class='bs-callout bs-callout-info'>
    <h4>${loc.translate(_("Ready"))}</h4>
    <p>${loc.translate(_("Action successfully completed"))}</p>
</div>
% endif
<h1>${loc.translate(_("My Bitcoin Wallets"))}</h1>
<div style="padding-top: 1em; padding-left: 1em;">
    <h4>
        ${loc.translate(_("Total Balance"))}:${total_balance} ${loc.translate(_("BTC"))}
    </h4>
</div>

<div class="btn-group pull-right">
    <button type="button" class="btn btn-link dropdown-toggle"
            data-toggle="dropdown" title="${loc.translate(_("Actions"))}">
        ${loc.translate(_("Actions"))}
        <span class="caret"></span>
    </button>

    <ul class="dropdown-menu" role="menu">
        % if bitcoin_importkey=='true':
        <li>
            <a data-toggle='modal' href='#modalImport' class="pull-left"          
               title="${loc.translate(_("Import Private Key"))}">${loc.translate(_("Import Private Key"))}</a>
        </li>
        % endif

        % if len(wallets) > 0:
        <li>
            <a data-toggle='modal' href='#modalListTransactions' class="pull-left"           
               title="${loc.translate(_("Transaction List"))}">${loc.translate(_("Transaction List"))}</a>
        </li>
        % endif
        
        <li>
            <a data-toggle='modal' href='#createWallet' class="pull-left"          
               title="${loc.translate(_("Create a new wallet"))}">${loc.translate(_("Create a new wallet"))}</a>
        </li>
        
        % if len(wallets) > 0:
        <li>
            <a data-toggle='modal' href='#modalMove'          
               class="pull-left" title="${loc.translate(_("Transfer money between my wallets"))}">
               ${loc.translate(_("Transfer money between my wallets"))}</a>
        </li>
        % endif 
        
        % if len(wallets) > 0:
        <li>
            <a data-toggle='modal' href='#modalChangeName'          
               class="pull-left" title="${loc.translate(_("Change the wallet name"))}">
               ${loc.translate(_("Change the wallet name"))}</a>
        </li>
        % endif

    </ul>
</div>
##----------------------------------------------
<div class="modal fade" id="modalImport" tabindex="-1" role="dialog" aria-labelledby="modalImportLabel" aria-hidden="true">
    <div class="modal-dialog" align="center">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">${loc.translate(_("Private Key Import"))}</h4>
            </div>

            <div class="modal-body" id="importDiv">
                ## тут POST
                <form id="importForm" class="form-inline" role="form" action="" method='POST'>
                    <div class="form-group">

                        <div style="padding-right:1em;">
                            
                            <div align="right">
                    ${loc.translate(_("Enter Private Key"))}:
                    <input class="form-control"              
                     type="text"               
                     name="privkey"              
                     required="required"              
                     title="${loc.translate(_("Enter Private Key"))}"              
                     minlength="50"              
                     tabindex="1"              
                     data-validation-required-message="${_('This field is required')}"                
                     data-validation-minlength-message="${_('This field is too short')}"/>
                            </div>
                    
                            <div align="right">
                    ${loc.translate(_("Wallet name"))}:
                    <input class="form-control"              
                     type="text"               
                     name="newwallet_create_from_import"              
                     required="required"              
                     title="${loc.translate(_("Wallet name"))}"              
                     minlength="1"              
                     tabindex="1"              
                     data-validation-required-message="${_('This field is required')}"                
                     data-validation-minlength-message="${_('This field is too short')}"/>
                            </div>

                        </div>

                    <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>
                        <br />
                        <button type="submit" name="submit" class="btn btn-default"                
                                title="${loc.translate(_("Import"))}"                
                        onclick="importKey('importDiv', 'importForm', '${request.route_url("bitcoin.cl.create_wallet_from_import")}')">
                        ${loc.translate(_("Import"))}
                        </button>
                    </div>
                </form>
                
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
    </div>
</div>
##----------------------------------------------
<div class="modal fade" id="modalListTransactions" tabindex="-1" role="dialog" aria-labelledby="modalListTransactionsLabel" aria-hidden="true">
    <div class="modal-dialog" align="center">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">${loc.translate(_("Transaction List"))}</h4>
            </div>

            <div class="modal-body" id="ListTransactionsDiv">
                ## тут POST
                <form id="ListTransactionsForm" class="form-inline" role="form"          
                      action="${req.route_url('bitcoin.cl.listtrans')}" method='POST'>

                    <div class="form-group">

                    ${loc.translate(_("I want to see"))}
                    <input style="width:4em;"         
                     class="form-control"         
                     type="number"         
                     name="number"                 
                     required="required"         
                     min="0"         
                     tabindex="1"         
                     data-validation-required-message="${_('This field is required')}"           
                     data-validation-min-message="${_('Error. Min number is 0.')}"/>
                        ${loc.translate(_("recent transactions"))}
                        <br />

                        <div align='left'>
                            ${loc.translate(_("Wallet name"))}:
                            <select size="1" name="account_of_wallet">
                                % for wallet in wallets:
                                    <option value="${wallet['wallet']}">${wallet['wallet']}</option>
                                %endfor
                            </select>

                    <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>
                    
                    <button type="submit"class="btn btn-default" name="submit"                
                            title="${loc.translate(_("Display"))}"                
                            style="margin-left:1em;">${loc.translate(_("Display"))}
                    </button>
                        </div>

                    </div>        
                </form>
                
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default"  data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
    </div>
</div>
##----------------------------------------------
<div class="modal fade" id="createWallet" tabindex="-1" role="dialog" aria-labelledby="createWalletLabel" aria-hidden="true">
    <div class="modal-dialog" align="center">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">${loc.translate(_("Create a new wallet"))}</h4>
            </div>

            <div class="modal-body" id="createDiv">
                ## тут POST
                <form id="createForm" class="form-inline" role="form" action="" method='POST'>
                    <div class="form-group">

        ${loc.translate(_("Wallet name"))}:
        <input class="form-control"              
           type="text"               
           name="newwallet_create"              
           required="required"              
           title="${loc.translate(_("Wallet name"))}"              
           minlength="1"              
           tabindex="1"              
           data-validation-required-message="${_('This field is required')}"                
           data-validation-minlength-message="${_('This field is too short')}"/>

        <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>

        <button type="submit" name="submit" class="btn btn-default"                
                title="${loc.translate(_("Create"))}"               
                onclick="createWallet('createDiv', 'createForm', '${request.route_url("bitcoin.cl.create_wallet")}')">
                ${loc.translate(_("Create"))}
        </button>
                    </div>
                </form>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
    </div>
</div>
##----------------------------------------------
<div class="modal fade" id="modalMove" tabindex="-1" role="dialog" aria-labelledby="modalMoveLabel" aria-hidden="true">
    <div class="modal-dialog" align="center">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">${loc.translate(_("Transfer money between my wallets"))}</h4>
            </div>

            <div class="modal-body" id="moveDiv">
                ## тут POST
                <form id="moveForm" class="form-inline" role="form" action="" method='POST'>
                    <div class="form-group">
                        
                        <div align="center">    
                                    ${loc.translate(_("From (wallet name)"))}:
                                    <br />
                                    <select size="1" name="fromaccount">
                                        % for wallet in wallets:
                                            <option value="${wallet['wallet']}">${wallet['wallet']}</option>
                                        %endfor
                                    </select>
                              <br />
                              <br />

                                    ${loc.translate(_("To (wallet name)"))}:
                                    <br />
                                    <select size="1" name="toaccount">
                                        % for wallet in wallets:
                                            <option value="${wallet['wallet']}">${wallet['wallet']}</option>
                                        %endfor
                                    </select>
                        </div>
                        <br />
                        
                ${loc.translate(_("Аmount of transfer"))}:
                <input class="form-control"               
                   type="number"                          
                   name="аmount"              
                   title="${loc.translate(_("Аmount of transfer"))}"                           
                   required="required"              
                   min="0"              
                   tabindex="1"              
                   data-validation-min-message="${_('Error. Min number is 0.')}"              
                   data-validation-required-message="${_('This field is required')}"/>

                <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>

                <button type="submit" class="btn btn-default" title="${loc.translate(_("Transfer Money"))}"       
                        onclick="moveCoints('moveDiv', 'moveForm', '${request.route_url("bitcoin.cl.move")}')">
                        ${loc.translate(_("Transfer Money"))}
                </button>
                 
                    </div>
                </form>
                    
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
    </div>
</div>
##----------------------------------------------
<div class="modal fade" id="modalChangeName" tabindex="-1" role="dialog" aria-labelledby="modalChangeNameLabel" aria-hidden="true">
    <div class="modal-dialog" align="center">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">${loc.translate(_("Change the wallet name"))}</h4>
            </div>

            <div class="modal-body" id="ChangeNameDiv">
                ## тут POST
                <form id="ChangeNameForm" class="form-inline" role="form" action="" method='POST'>
                    <div class="form-group">

                        <div align='center'>
                            ${loc.translate(_("Old wallet name"))}:
                            <select size="1" name="old_account">
                                % for wallet in wallets:
                                    <option value="${wallet['wallet']}">${wallet['wallet']}</option>
                                %endfor
                            </select>
                        </div>
                        <br />

                        <div align='left'>
                    ${loc.translate(_('New wallet name'))}:
                    <input class="form-control"              
                         type="text"               
                         name="new_account"              
                         required="required"              
                         title="${loc.translate(_('New wallet name'))}"              
                         minlength="1"              
                         tabindex="1"              
                         data-validation-required-message="${_('This field is required')}"                
                         data-validation-minlength-message="${_('This field is too short')}"/>

                    <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>
                    
                    <button type="submit" class="btn btn-default" title="${loc.translate(_('Change'))}"       
                            onclick="changeNameWallet('ChangeNameDiv', 'ChangeNameForm', '${request.route_url("bitcoin.cl.change_name")}')">
                            ${loc.translate(_("Change"))}
                    </button>
                        </div>

                    </div>
                </form>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
    </div>
</div>
##---------------------------------------------------------------------------------------------
% if len(wallets) == 0:
<div class="jumbotron">
    <div align="center">
        <h4>${loc.translate(_("You have no wallets yet."))}</h4>
        <a data-toggle='modal' href='#createWallet' class="btn  btn-default"          
           title="${loc.translate(_("Create a new wallet"))}">${loc.translate(_("Create a new wallet"))}</a>
    </div>
</div>
% else:
<table class="table table-hover">
    <tr>
        <td align="center"> <strong>${loc.translate(_("Wallets"))}</strong>
        </td>
        <td align="center"> <strong>${loc.translate(_("Balance for wallet"))}</strong>
        </td>
        <td align="center">
            <strong>${loc.translate(_("Address"))}</strong>
        </td>
        <td align="center">
            <strong>${loc.translate(_("Export Private Key"))}</strong>
        </td>
        <td align="center">
            <strong>${loc.translate(_("Send money"))}</strong>
        </td>
    </tr>
% for w in wallets:
    <tr>
        <td align="center">${w['wallet']}</td>
        <td align="center">${w['balance']} ${loc.translate(_("BTC"))}</td>         
        <td align="center">${w['address']}</td>

        <td align="center">
            <a data-toggle='modal' href='#modalExport${w['address']}' title="${loc.translate(_("Private Key"))}"     
               onClick="exportPrivKey('${w['address']}','${request.route_url("bitcoin.cl.export")}', 'resp${w['address']}');">
               ${loc.translate(_("Private Key"))}
            </a>

            <div class="modal fade" id="modalExport${w['address']}" tabindex="-1" role="dialog" aria-labelledby="modalExportLabel${w['address']}" aria-hidden="true">
            
                <div class="modal-dialog" align="center">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">${loc.translate(_("Private Key Export"))}</h4>
                        </div>

                        <div class="modal-body" id="resp${w['address']}">${loc.translate(_("Wait please..."))}</div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
                        </div>

                    </div>
                </div>

            </div>
        </td>

        <td align="center">
            <a data-toggle='modal'  href="#modalSend${w['address']}" title="${loc.translate(_("Send"))}"      
               class="btn btn-link" >${loc.translate(_("Send"))}
            </a>

            <div class="modal fade" id="modalSend${w['address']}" tabindex="-1" role="dialog" aria-labelledby="modalSendLabel${w['address']}" aria-hidden="true">
                <div class="modal-dialog" align="center">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">${loc.translate(_("Send money"))}</h4>
                        </div>

                        <div class="modal-body" id="sendDiv${w['address']}">
                            ## тут POST
                            <form id="sendForm${w['address']}" class="form-inline" role="form" action="" method='POST'>
                                <div class="form-group">
                        
                                    <div align="right">
                        ${loc.translate(_("Bitcoin address to send to"))}:
                        <input class="form-control"                
                           type="text"               
                           name="tobitcoinaddress"               
                           required="required"               
                           title="${loc.translate(_("Bitcoin address to send to"))}"              
                           minlength="20"              
                           tabindex="1"              
                           data-validation-required-message="${_('This field is required')}"                
                           data-validation-minlength-message="${_('This field is too short')}"/>
                                    </div>

                                    <div align="right">
                        ${loc.translate(_("Amount to send"))}:
                        <input class="form-control"               
                           type="number"              
                           name="send_amount"              
                           title="${loc.translate(_("Amount to send"))}"              
                           required="required"              
                           min="0"             
                           tabindex="2"             
                           data-validation-required-message="${_('This field is required')}"               
                           data-validation-min-message="${_('Error. Min number is 0.')}"/>
                                    </div>

                                    <div align="right">
                        ${loc.translate(_("Comment for recipient"))}:
                        <span class="req">*</span>
                        <input class="form-control"               
                           type="text"               
                            name="comment_to"              
                            title="${loc.translate(_("Comment for recipient"))}"              
                            tabindex="3"/>
                                    </div>

                                    <div align="right">
                        ${loc.translate(_("Comment for transaction"))}:
                        <span class="req">*</span>
                        <input class="form-control"               
                           type="text"               
                           name="comment"              
                           title="${loc.translate(_("Comment for transaction"))}"              
                           tabindex="4"/>
                                    </div>

                        <input type="hidden"  name="fromaccount" value="${w['wallet']}"/>
                        <input type="hidden" id="csrf" name="csrf" value="${req.get_csrf()}"/>
                                    <br />

                        <button type="submit" class="btn btn-default" title="${loc.translate(_("Send money"))}" 
                                onclick="sendCoints('sendDiv${w["address"]}', 'sendForm${w["address"]}', '${request.route_url("bitcoin.cl.send")}')">
                                ${loc.translate(_("Send money"))}
                        </button>
                        
                                </div>
                            
                                <br />
                                <br />
                            <div class="pull-left">
                                <span class="req">*</span>
                                ${loc.translate(_("This field is optional"))}
                            </div>
                            
                            </form>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    
% endfor
</table>
% endif