*** Settings ***
Documentation        Cenário de teste que valida o caminho completo

Library    Browser
Library    ../libs/Account.py

*** Variables ***
${rate_loc_positive}        xpath=//div[contains(text(), "Localização ")]/following-sibling::div[@class="col-auto"]/descendant::*[@class="btn-like btn"]
${rate_service_positive}    xpath=//div[contains(text(), "Atendimento")]/following-sibling::div[@class="col-auto"]/descendant::*[@class="btn-like btn"]
${rate_quality_postive}     xpath=//div[contains(text(), "Qualidade")]/following-sibling::div[@class="col-auto"]/descendant::*[@class="btn-like btn"]
${rate_variety_negative}    xpath=//div[contains(text(), "Variedade")]/following-sibling::div[@class="col-auto"]/descendant::*[@class="btn-dislike btn"]


*** Keywords ***
Answer research
    
    Click    ${rate_variety_negative}
    Click    ${rate_service_positive}
    Click    ${rate_loc_positive}
    Click    ${rate_quality_postive} 
    

    Fill Text    id=commentArea  Mais um Teste

    Click    xpath=//button[contains(@id ,"submitButton")]

Validate research message
    ${message}    Get Element By Role    heading    name=Obrigado!

    Wait For Elements State    
    ...    ${message}    
    ...    visible    120



