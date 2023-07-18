*** Settings ***
Documentation     A test suite with multiple tests for invalid forgot password.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Forgot Password With Invalid Credentials Should Fail
Resource          ../../resources/general.resource

*** Test Cases ***               USER NAME        
Invalid Email                 ${INVALID USER}
Empty Username                ${EMPTY}

*** Keywords ***
Forgot Password With Invalid Credentials Should Fail
    [Arguments]    ${email}    
    Open Browser To Login Page
    Click Link    link:I forgot my password
    Forgot Password Page Should Be Open
    Input Username    ${email}
    Wait Captcha
    Submit Credentials
    Submit Error Element Should Be Shown
    [Teardown]    Close Browser

Submit Error Element Should Be Shown
    SeleniumLibrary.Element Text Should Be    //span[text()="Your email address is not registered"]   Your email address is not registered

