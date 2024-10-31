*** Settings ***

Documentation    Arquivo principal do projeto

Variables    Env.py
Library      Browser

*** Keywords ***
Start Session

    Set Browser Timeout    01:00
    New Browser   browser=${BROWSER}    headless=${HEADLESS}
    New Page   ${BASE_URL}
  
Start Email Session
    
    Set Browser Timeout    01:00
    New Browser   browser=${BROWSER}   headless=${HEADLESS}
    New Page   https://tuamaeaquelaursa.com