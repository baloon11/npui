## -*- coding: utf-8 -*-
<%inherit file="netprofile_access:templates/client_layout.mak"/>

<ol class="breadcrumb">
  <li>
    <a href="${req.route_url('bitcoin.cl.wallet')}">${loc.translate(_("My Bitcoin Wallets"))}</a>
  </li>
  <li class="active">${loc.translate(_("Transaction List"))}</li>
  <li class="active">${transaction_account}</li>
</ol>

<div align="left">
  <h1>${transaction_account}</h1>
</div>

<div style="padding-top: 2em;">
%if transaction_list:
              <table class='table table-hover'>
    <tr>
      <td align="center"> <strong>${loc.translate(_("Сategory of transaction"))}</strong>
      </td>

      <td align="center"> <strong>${loc.translate(_("Amount"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Other account"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Address"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Confirmation"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Transaction ID"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Message"))}</strong>
      </td>

      <td align="center">
        <strong>${loc.translate(_("Message to recipient"))}</strong>
      </td>

    </tr>
  % for transaction in transaction_list :
    <tr>
      <td align="center">${transaction['category']}</td>
      <td align="center">${transaction['amount']}</td>

      <td align="center">
        <a data-toggle='modal' href='#otheraccountModal${loop.index}' 
           title="${loc.translate(_("Account funds were moved to or from"))}">
           ${loc.translate(_("Other account"))}
        </a>
      </td>

      <td align="center">
        <a data-toggle='modal' href='#AddressModal${loop.index}' 
           title="${loc.translate(_("The address bitcoins were sent to, or received from"))}">
           ${loc.translate(_("Address"))}
        </a>
      </td>

      <td align="center">
        <a data-toggle='modal' href='#ConfirmationsModal${loop.index}' 
           title="${loc.translate(_("Confirmation"))}">
           ${loc.translate(_("Confirmation"))}
        </a>
      </td>

      <td align="center">
        <a data-toggle='modal' href='#txidModal${loop.index}' 
           title="${loc.translate(_("Transaction ID"))}">
           ${loc.translate(_("Transaction ID"))}
        </a>
      </td>

      <td align="center">
        <a data-toggle='modal' href='#MessageModal${loop.index}' 
           title="${loc.translate(_("Message associated with transaction"))}">
           ${loc.translate(_("Message"))}
        </a>
      </td>

      <td align="center">
        <a data-toggle='modal' href='#toModal${loop.index}' 
          title="${loc.translate(_("Message-to associated with transaction"))}">
          ${loc.translate(_("Message to recipient"))}
        </a>
      </td>

    </tr>
##----------------------------------
    <div class="modal fade" id="otheraccountModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="otheraccountModalLabel${loop.index}" aria-hidden="true">
      <div class="modal-dialog" align="center">
        <div class="modal-content">
          
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">&times;
              </button>
              <h4 class="modal-title">${loc.translate(_("Other account"))}</h4>
            </div>

            <div class="modal-body">${transaction['otheraccount']}</div>
          
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>

        </div>
      </div>
    </div>
##----------------------------------
      <div class="modal fade" id="AddressModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="AddressModalLabel${loop.index}" aria-hidden="true">
        <div class="modal-dialog" align="center">
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">&times;
              </button>
              <h4 class="modal-title">${loc.translate(_("Address"))}</h4>
            </div>

            <div class="modal-body">${transaction['address']}</div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
            </div>
        
          </div>
        </div>
      </div>
##----------------------------------
        <div class="modal fade" id="ConfirmationsModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="ConfirmationsModalLabel${loop.index}" aria-hidden="true">
          <div class="modal-dialog" align="center">
            <div class="modal-content">
            
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;
                </button>
                <h4 class="modal-title">${loc.translate(_("Confirmation"))}</h4>
              </div>
            
              <div class="modal-body">${transaction['confirmations']}</div>
            
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
              </div>
              
            </div>
          </div>
        </div>
##----------------------------------
          <div class="modal fade" id="txidModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="txidModalLabel${loop.index}" aria-hidden="true">
            <div class="modal-dialog" align="center">
              <div class="modal-content">
              
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                          <span aria-hidden="true">&times;
                  </button>
                  <h4 class="modal-title">${loc.translate(_("Transaction ID"))}</h4>
                </div>
              
                <div class="modal-body">${transaction['txid']}</div>
              
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
                </div>
                
              </div>
            </div>
          </div>
##----------------------------------
            <div class="modal fade" id="MessageModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="MessageModalLabel${loop.index}" aria-hidden="true">
              <div class="modal-dialog" align="center">
                <div class="modal-content">
                
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title">${loc.translate(_("Message"))}</h4>
                  </div>
                
                  <div class="modal-body">${transaction['message']}</div>
                
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
                  </div>
                  
                </div>
              </div>
            </div>
##----------------------------------
              <div class="modal fade" id="toModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="toModalLabel${loop.index}" aria-hidden="true">
                <div class="modal-dialog" align="center">
                  <div class="modal-content">

                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">
                              <span aria-hidden="true">&times;
                      </button>
                      <h4 class="modal-title">${loc.translate(_("Message to recipient"))}</h4>
                    </div>

                    <div class="modal-body">${transaction['to']}</div>

                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">${loc.translate(_("Close"))}</button>
                    </div>

                  </div>
                </div>
              </div>
  % endfor
              </table>
% endif 
##--------------------------------------------------------------------------------------------
      %if error_number:
              <div class="jumbotron">
                <div align="center">
                  <h4>
                    ${loc.translate(_("You entered the number of transactions equal to 0."))}
                    <br />
                    <br />
                    ${loc.translate(_("Try again"))}
                    <br />
                    <br />
                    <a data-toggle='modal' href='#modalListTransactions' 
                       class="btn btn-default" title="${loc.translate(_("Transaction List"))}">
                       ${loc.translate(_("Transaction List"))}
                    </a>
                  </h4>
                </div>
              </div>
      % endif 
##----------------------------------
      %if empty_list_transaction:
              <div class="jumbotron">
                <div align="center">
                  <h4>
                    ${loc.translate(_("With this wallet is not associated any transaction."))}
                    <br />
                    <br />
                    ${loc.translate(_("Try again"))}
                    <br />
                    <br />
                    <a data-toggle='modal' href='#modalListTransactions'     
                       class="btn btn-default" title="${loc.translate(_("Transaction List"))}">
                       ${loc.translate(_("Transaction List"))}
                    </a>
                  </h4>
                </div>
              </div>
      % endif
##----------------------------------
      %if error_number_and_empty_list_transaction:
              <div class="jumbotron">
                <div align="center">
                  <h4>
                    ${loc.translate(_("With this wallet is not associated any transaction and you entered the number of transactions equal to 0."))}
                    <br />
                    <br />
                    ${loc.translate(_("Try again"))}
                    <br />
                    <br />
                    <a data-toggle='modal' href='#modalListTransactions'      
                       class="btn btn-default" title="${loc.translate(_("Transaction List"))}">
                       ${loc.translate(_("Transaction List"))}
                    </a>
                  </h4>
                </div>
              </div>
      % endif
##----------------------------------
      %if error_number_field:
              <div class="jumbotron">
                <div align="center">
                  <h4>
                    ${loc.translate(_("Error in the field 'number'"))}
                    <br />
                    <br />
                    ${loc.translate(_("Try again"))}
                    <br />
                    <br />
                    <a data-toggle='modal' href='#modalListTransactions'      
                       class="btn btn-default" title="${loc.translate(_("Transaction List"))}">
                       ${loc.translate(_("Transaction List"))}
                    </a>
                  </h4>
                </div>
              </div>
      % endif
</div>
##--------------------------------------------------------------------------------------------
            <div class="modal fade" id="modalListTransactions"tabindex="-1" role="dialog" aria-labelledby="modalListTransactionsLabel" aria-hidden="true">
              <div class="modal-dialog" align="center">
                <div class="modal-content">

                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">${loc.translate(_("Transaction List"))}</h4>
                  </div>

                  <div class="modal-body" id="ListTransactionsDiv">
                    ## тут POST
                    <form id="ListTransactionsForm" 
                          class="form-inline" role="form" action="${req.route_url('bitcoin.cl.listtrans')}" method='POST'>

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
                
                <button type="submit"class="btn btn-default"                
                        name="submit" style="margin-left:1em;">${loc.translate(_("Display"))}
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