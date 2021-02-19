*** Settings ***
Library     webdriverManager.py

*** Keywords ***
Open ${BROWSER} To Google
    ${webdriver_path}=    webdriverManager.Get Webdriver Path    ${BROWSER}
    Open Browser    https://www.google.com  ${BROWSER}    executable_path=${webdriver_path}
    Maximize Browser Window
    Google Should Be Open

Search For adobe
    Input Text   q   adobe
    Press Keys    q   RETURN

Result Should Contain Adobe
    Wait Until Page Contains  adobe.com  30 s

Google Should Be Open
    Location Should Contain    www.google.com