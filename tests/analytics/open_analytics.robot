*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource

*** Test Cases ***
Valid Switch App
    Open Browser To Switch App Page
    Switch App Page Should Be Open