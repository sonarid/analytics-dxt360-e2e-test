*** Settings ***
Documentation     A test suite with a single test for valid login.
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
Invalid Username And Password    ${INVALID USER}          ${INVALID PASSWORD}
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Password                   ${VALID USER}    ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Wait Captcha
    Submit Credentials
    Login Page Should Be Open
    Login Should Have Failed

Login Should Have Failed
    Page Should Contain Element    css:div[background-color="#fff9f9"]