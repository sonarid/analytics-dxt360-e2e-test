*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource

*** Test Cases ***
Valid Switch App
    
    Open Browser To Switch App Page
    Go To    ${WELCOME URL}
    Welcome Page Should Be Open
    [Teardown]     Load Saved Cookies