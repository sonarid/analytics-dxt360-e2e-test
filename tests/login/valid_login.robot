*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource 

*** Keywords ***
Valid Login
    Open Browser To Login Page
    Input Login Field    ${VALID USER}    ${VALID PASSWORD}
    Submit Credentials        