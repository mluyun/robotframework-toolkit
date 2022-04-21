*** Settings ***
Resource            CommonResource.resource
Force Tags          edge
Suite Teardown    Close all browsers


*** Test Cases ***
Google Robot Framework And Find robotframework.org
    Open Edge To Google
    Search For Robot Framework
    Result Should Contain    robotframework.org
