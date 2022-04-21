*** Settings ***
Resource            CommonResource.resource
Force Tags          firefox
Suite Teardown    Close all browsers


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Open Firefox To Google
    Search For Robot Framework
    Result Should Contain    robotframework.org
