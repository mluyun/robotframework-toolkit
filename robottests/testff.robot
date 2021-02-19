*** Settings ***
Library           Selenium2Library
Resource            CommonResource.resource
Force Tags          firefox
Suite Teardown    Close all browsers

*** Test Cases ***
Google Adobe And Find adobe.com
    Open Firefox To Google
    Search For Adobe
    Result Should Contain Adobe


