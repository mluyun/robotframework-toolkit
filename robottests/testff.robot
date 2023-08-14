*** Settings ***
Resource            CommonResource.resource
Suite Setup    Open Firefox To Google
Test Tags          firefox
Test Teardown    Close Browser


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Search For Robot Framework
    Result Should Contain    robotframework.org
