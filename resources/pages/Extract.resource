*** Settings ***
Documentation    elementos da tela de Login

Library    Browser
Resource   Research.resource

*** Keywords **
Find the research
    [Arguments]    ${full_email}

    Fill Text    xpath=//*[contains(@placeholder ,"Search by transaction number")]    ${full_email}
    Click    xpath=//button[@class="btn bg-primary text-white"]
    
    Get Text    xpath=//span[@class="transactions-amount"]    equal     1 results
    Click    id=transaction-0

Validate research rating

    
    ${research_rankin}=        Get Text         xpath=//div[@class="form-group mb-0"]/descendant::span[contains(text(), "10")]
    ${loc_avaliation} =        Get Attribute    xpath=//span[contains(text(), "Localização")]    class
    ${service_avaliation} =    Get Attribute    xpath=//span[contains(text(), "Atendimento")]    class
    ${quality_avaliation} =    Get Attribute    xpath=//span[contains(text(), "Qualidade")]    class
    ${variety_avaliation} =    Get Attribute    xpath=//span[contains(text(), "Variedade")]    class

    Should Contain    ${research_rankin}       10
    Should Contain    ${loc_avaliation}        positive
    Should Contain    ${service_avaliation}    positive
    Should Contain    ${quality_avaliation}    positive
    Should Contain    ${variety_avaliation}    negative
 