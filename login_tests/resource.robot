*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         login-dxt360.sonarplatform.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo.analytics@dxt360.app
${VALID PASSWORD}    p3iN%u49
${LOGIN URL}      https://${SERVER}/login
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/login

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
    [Arguments]    ${email} 
    Input Text    css:input[placeholder="Please enter your email Address"]   ${email}

Input Password
    [Arguments]    ${password}
    Input Text    css:input[placeholder="Please enter your password"]    ${password}


# Submit Credentials
#     # Execute Manual Step    Please complete the CAPTCHA portion of the form.
#     # Click Button    type:Submit


Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Switch App | DXT360 App
