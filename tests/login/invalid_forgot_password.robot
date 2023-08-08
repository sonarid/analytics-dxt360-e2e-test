*** Settings ***
Documentation     A test suite with multiple tests for invalid forgot password.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       Open Browser To Login Page
Resource          ../../resources/general.resource
Resource          ../../resources/login_page.resource

*** Test Cases ***               USER NAME        
Invalid Email | ${INVALID USER}
Empty Username | ${EMPTY}

*** Keywords ***
Forgot Password With Invalid Credentials Should Fail
    [Arguments]    ${email}    
    Click Link    link:Forgot Password?
    Forgot Password Page Should Be Open
    Input Username    ${email}
    Wait Captcha
    Submit Credentials
    Submit Error Element Should Be Shown
    [Teardown]    Close Browser

Submit Error Element Should Be Shown
    SeleniumLibrary.Element Text Should Be    //span[text()="Your email address is not registered"]   Your email address is not registered

