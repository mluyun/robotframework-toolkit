*** Settings ***
Library     SeleniumLibrary
Library    drivermanagement.py

*** Keywords ***
Open ${BROWSER} To Google
    ${driver_options}=    drivermanagement.Get Webdriver Options    ${BROWSER}
    Open Browser    https://www.google.com  ${BROWSER}    options=${driver_options}
    ${screen_size}=    Get Window Size    ${True}
    Log To Console    Screen Size upon browser instantiation: ${screen_size}
    Google Should Be Open

Search For Robot Framework
    Input Text   q   Robot Framework
    Press Keys    q   RETURN

Result Should Contain    [Arguments]    ${expectedValue}
    Wait Until Page Contains  ${expectedValue}  30 s

Google Should Be Open
    Location Should Contain    www.google.com