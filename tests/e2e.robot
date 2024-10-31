*** Settings ***
Documentation        Cenário de teste que realiza o preenchimento do formulário -> acessa o email -> responde a pesquisa

Library        Browser     

Resource    ../resources/Base.resource
Resource    ../resources/pages/Login.resource
Resource    ../resources/pages/Home.resource
Resource    ../resources/pages/Operational.resource
Resource    ../resources/pages/Research.resource
Resource    ../resources/pages/Extract.resource

*** Variables ***
${email_message}    xpath=//div[@class="the-message-subject"][contains(text(), "Olá")]


*** Test Cases ***
Armazenar Valor Do Email
    [Tags]    test:retry(2)

    Start Email Session
    ${email_value}=    Get Attribute    xpath=//div[@class="email-section global-header-email-form"]/descendant::form    action
    ${full_email} =    Set Variable    ${email_value}@tuamaeaquelaursa.com
    Set Suite Variable    ${email_value}    ${email_value}
    Set Suite Variable    ${full_email}    ${full_email}
    
Preencher Form de Cadastro    
    [Tags]    test:retry(2)

    Start Session
    Wait for button be visible
    Fill login form
    Wait Login Page load
    Close solucxWidgetFrame
    Open Operational Screen
    Fill the form    ${full_email}

Acessar Email e Responder Formulário
    [Tags]    test:retry(2)  
    
    New Browser   browser=${BROWSER}   headless=${HEADLESS}
    Set Browser Timeout    01:00
    New Page   https://tuamaeaquelaursa.com/${email_value}
    
    Wait For Elements State    ${email_message}    
    ...    visible    120

    Click    ${email_message}
    Click    xpath=//a[contains(@href ,"rating=10")]

    Answer research
    Validate research message

Validar Pesquisa
    [Tags]    test:retry(2)

    Start Session
    Wait for button be visible
    Fill login form
    Wait Login Page load
    Close solucxWidgetFrame
    Find the research    ${full_email}
    Validate research rating