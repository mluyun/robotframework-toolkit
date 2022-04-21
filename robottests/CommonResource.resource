*** Settings ***
Library     webdriverManager.py
Library     SeleniumLibrary

*** Keywords ***
Open ${BROWSER} To Google
    ${webdriver_path}=    webdriverManager.Get Webdriver Path    ${BROWSER}
    Open Browser    https://www.google.com  ${BROWSER}    executable_path=${webdriver_path}
    Maximize Browser Window
    Google Should Be Open

Search For Robot Framework
    Input Text   q   Robot Framework
    Press Keys    q   RETURN

Result Should Contain    [Arguments]    ${expectedValue}
    Wait Until Page Contains  ${expectedValue}  30 s

Google Should Be Open
    Location Should Contain    www.google.com