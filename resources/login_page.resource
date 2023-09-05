*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          general.resource 

*** Keywords ***
Valid Login
    Open Browser To Login Page
    Input Login Field    ${VALID USER}    ${VALID PASSWORD}
           
Input Login Field
    [Arguments]     ${email}     ${password}
    Input Username      ${email}
    general.Input Password    ${password}
    Wait Until Page Contains Element    //*[text()='Log In' and not(contains(@class, 'disabled'))]
    Submit Credentials 
    Wait Until Location Is Not    ${LOGIN URL}    10
    # Wait Captcha 

Input Invalid Login Field
    [Arguments]     ${email}     ${password}
    Input Username    ${email}
    general.Input Password    ${password}
    Wait Until Page Contains Element    //*[text()='Log In' and not(contains(@class, 'disabled'))]
    Submit Credentials 
    # Wait Captcha 

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Login Page Should Be Open


Login Page Should Be Open
    Set Selenium Speed    0
    Title Should Be    Login | DXT360 App


Login Button Should Be Disabled
      Element Should Be Disabled    //button


Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open


