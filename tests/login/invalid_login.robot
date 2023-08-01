*** Settings ***
Documentation     A test suite with a multiple tests for invalid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          ../../resources/general.resource

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 ${INVALID USER}          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    ${INVALID PASSWORD}
# Invalid Username And Password    ${INVALID USER}          ${INVALID PASSWORD}
# Empty Username                   ${EMPTY}         ${VALID PASSWORD}
# Empty Password                   ${VALID USER}    ${EMPTY}
# Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    general.Input Password    ${password}
    Wait Captcha
    Submit Credentials
    Login Should Have Failed

Login Error Element Should Be Shown
    SeleniumLibrary.Element Text Should Be    //span[text()="We could not find that email and password combination"]   We could not find that email and password combination 

Login Should Have Failed
    Login Page Should Be Open
    Login Error Element Should Be Shown
