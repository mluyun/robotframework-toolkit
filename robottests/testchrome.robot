*** Settings ***
Resource            CommonResource.resource
Suite Setup    Open headlesschrome To Google
Test Tags          chrome
Test Teardown    Close Browser


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Search For Robot Framework
    Result Should Contain    robotframework.org

Google Robot Framework And Find infor
    Input Text   q   infor
    Press Keys    q   RETURN
    Result Should Contain    infor

Google Robot Framework And Find ikea
    Input Text   q   ikea
    Press Keys    q   RETURN
    Result Should Contain    ikea