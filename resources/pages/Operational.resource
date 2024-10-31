*** Settings ***
Documentation    Elementos do formulário da tela "Operacional"

Library    Browser
Library    ../libs/Account.py


*** Variables ***
${campo_Nome}=    xpath=//label[@class="mt-3"][contains(text(), "Name")]/following-sibling::div[@class="input-group"]/descendant::input[@class="form-control"]
${campo_CPF}=     xpath=//div[@class="p-4"]//label[@class="mt-3"][contains(text(), "CPF")]/following-sibling::div[@class="input-group"]/descendant::input[@class="form-control"]
${campo_CEL}=     xpath=//div[@class="p-4"]//label[@class="mt-3"][contains(text(), "Cell Phone Number")]/following-sibling::div[@class="input-group"]/descendant::input[@class="form-control"]    

${select_journey}=    xpath=//div[@id="journeySelect"]/descendant::div[@class="input-group"]/descendant::*[@class="form-control"]
${select_store}=      xpath=//div[@id="storeSelect"]/descendant::div[@class="input-group"]/descendant::*[@class="form-control"]
${select_employer}=   xpath=//div[@id="employerSelect"]/descendant::div[@class="input-group"]/descendant::*[@class="form-control"]


*** Keywords ***
Fill the form
    [Arguments]    ${full_email}
    
    ${account}    Get Account

    Fill Text    id=checkCustomerInput   ${full_email}
    Fill Text    id=amountInput    120

    Wait For Elements State    
    ...    id=errorMessage >> text=Customer E-mail not registered! 
    ...    visible    120

    Select Options By    ${select_journey}   value    258
    Select Options By    ${select_store}     label    Matriz
    Select Options By    ${select_employer}  label    Kaue Moura

    Get Element    ${campo_Nome}
    Fill Text      ${campo_Nome}    ${account}[name]

    Get Element    ${campo_CPF} 
    Fill Text      ${campo_CPF}    ${account}[document]

    Get Element    ${campo_CEL}
    Fill Text      ${campo_CEL}     ${account}[phone]
     
    Click    id=submitButton

    Wait For Elements State
    ...    xpath=//div[@role="alert"]/descendant::*[contains(text(), "Successfully registered customer")]
    ...    visible
    ...    120




