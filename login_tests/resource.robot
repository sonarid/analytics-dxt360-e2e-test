*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Dialogs

*** Variables ***
${SERVER}         login-dxt360.sonarplatform.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo.analytics@dxt360.app
${VALID PASSWORD}    p3iN%u49
${LOGIN URL}      https://${SERVER}/login
${WELCOME URL}    https://${SERVER}/
${ERROR URL}      https://${SERVER}/login
${FORGOT URL}     https://${SERVER}/forgot-password

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login | DXT360 App

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username} 
    Input Text    css:input[placeholder="Please enter your email Address"]   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css:input[placeholder="Please enter your password"]    ${password}

Wait Captcha
    Pause Execution             Enter captcha


Submit Credentials
    Click Button     //button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Switch App | DXT360 App

Forgot Password Page Should Be Open
    Location Should Be    ${FORGOT URL}
    Title Should Be    Forgot Password | DXT360 App

Return to Login
    Click Link    link:Return to login