*** Settings ***
Library           SeleniumLibrary
Resource            CommonResource.resource
Force Tags          chrome
Suite Teardown    Close all browsers

*** Test Cases ***
Google Adobe And Find adobe.com
    Open Chrome To Google
    Search For Adobe
    Result Should Contain Adobe



