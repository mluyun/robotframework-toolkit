*** Settings ***
Resource            CommonResource.resource
Suite Setup    Open Edge To Google
Test Tags          edge
Test Teardown    Close Browser


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Search For Robot Framework
    Result Should Contain    robotframework.org
