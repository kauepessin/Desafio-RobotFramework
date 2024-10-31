*** Settings ***
Documentation        Cenários de testes de login -> São executados 6 testes ao total porem ira ser contabilizado somente 2

Library        Browser

Resource    ../resources/Base.resource
Resource    ../resources/pages/Login.resource
Resource    ../resources/pages/Home.resource

Suite Setup    Close Browser
*** Test Cases ***
Deve realizar o login na aplicação
    [Tags]    test:retry(2)
    
    Start Session
    Wait for button be visible
    Fill login form
    Wait Login Page load
    Close solucxWidgetFrame
  
Tentativa de login
    [Tags]    test:retry(2)
    [Template]    Attempt Login
    
    teste@solucx.com    ${PASS}

    ${USER}     1234554

    ${USER}     ${EMPTY}

    ${EMPTY}    ${PASS}

    ${EMPTY}    ${EMPTY}

*** Keywords ***
Attempt Login
    [Arguments]    ${email}    ${senha}
    Start Session
    Submit attempt login    ${email}    ${senha}
    Notice invalid credentials