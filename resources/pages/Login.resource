*** Settings ***
Documentation    elementos da tela de Login
Variables    ../Env.py
Library    Browser
Library    ../libs/Account.py

*** Variables ***
${email_field}    xpath=//input[@placeholder='E-mail'] 
${pass_field}     xpath=//input[@placeholder='Password']

*** Keywords ***    
Wait for button be visible

       Wait For Elements State    
    ...    css=button >> text=Log in    
    ...    visible    180

Fill login form

    Fill Text    ${email_field}    ${USER}
    Fill Text    ${pass_field}     ${PASS}

    Click    css=button >> text=Log in

Notice invalid credentials
        Wait For Elements State    
   ...  xpath=//div[@role="alert"]/descendant::*[contains(text(), "Check the user and password entered.")]
   ...  visible    120
    
    Take Screenshot
Submit attempt login
    [Arguments]    ${email}    ${senha}
    
    Fill Text    ${email_field}    ${email}
    Fill Text    ${pass_field}     ${senha}
    
    Click    css=button >> text=Log in

    Take Screenshot


    