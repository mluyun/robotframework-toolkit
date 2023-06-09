*** Settings ***
Resource            CommonResource.resource
Test Tags          chrome
Suite Teardown    Close All Browsers


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Open Chrome To Google
    Search For Robot Framework
    Result Should Contain    robotframework.org
