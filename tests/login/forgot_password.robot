*** Settings ***
Documentation     A test suite with a single test for forgot password.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource

*** Test Cases ***
Forgot Password
    Open Browser To Login Page
    Click Link    link:I forgot my password
    Forgot Password Page Should Be Open
    Input Username    demo.analytics@dxt360.app
    Return to Login
    Login Page Should Be Open
    [Teardown]    Close Browser
