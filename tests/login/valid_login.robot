*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/login_page.resource

*** Test Cases ***

Login With Valid Credentials
    Valid Login
    Switch App Page Should Be Open