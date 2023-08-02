*** Settings ***
Documentation     A test suite with a single test for forgot password.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/login_page.resource

*** Test Cases ***
Forgot Password
    Open Browser To Login Page
    Click Link    link:Forgot Password?
    Forgot Password Page Should Be Open
    Input Username    ${VALID USER}
    Click Link    link:Return to login
    Wait Until Location Is    ${LOGIN URL}    
    Login Page Should Be Open
    [Teardown]    Close Browser
