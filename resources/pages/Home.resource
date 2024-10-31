*** Settings ***
Documentation    elementos da tela de Login

Library    Browser


*** Variables ***
${Element}   xpath=//div[@id="solucxWrapper"]/descendant::*[@id="solucxClose"]
${Element_Resumo}    xpath=//div[@id="app"]/descendant::div/descendant::div[@class="d-none d-md-block"]/descendant::div/descendant::nav[@class="sidebar bg-white shadow-sm position-relative"]/descendant::div[@class="menu flex-column"]/descendant::div[@class="menu-block-container div-menu position-relative nav-li"]
${Click_Operatinal}    xpath=//div[@id="app"]/descendant::div/descendant::div[@class="d-none d-md-block"]/descendant::div/descendant::nav[@class="sidebar bg-white shadow-sm position-relative"]/descendant::div[@class="menu flex-column"]/descendant::div[@class="menu-block-container div-menu position-relative nav-li"]/descendant::ul[contains(@class ,"sub__menu")]/descendant::li[@class="d-flex align-items-center"]/descendant::*[@class="btn-primary text-white text-decoration-none fs-6 w-100 h-100 px-3 py-3"][contains(text(), "Operational")]

*** Keywords ***
Wait Login Page load
    Wait For Elements State    text=General Extract    visible    5
    
Close solucxWidgetFrame

  Wait For Elements State    ${Element}    visible    10
  Click    ${Element}

Open Operational Screen
    Hover    
    ...    ${Element_Resumo}
    
    Click  ${Click_Operatinal}
    Hover    id=checkCustomerInput

    ${heading}=    Get Element By Role    heading    name=Summary
    Wait For Elements State    ${heading}    visible    5

