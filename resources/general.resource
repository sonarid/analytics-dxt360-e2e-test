*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Dialogs
# Library           XML
Library           OperatingSystem
Library           Process
Library           String
Variables         load_env.py
# Library           RequestsLibrary
# Library           Collections
# Library           RPA.Browser.Selenium

*** Variables ***
${SERVER}         login-dxt360.sonarplatform.com
${BROWSER}        Chrome
${DELAY}          1    
${VALID USER}     ${email_user}
${VALID PASSWORD}     ${password_user}
${INVALID USER}     fail@dxt360.app
${INVALID PASSWORD}    p3iN%u26
${LOGIN URL}      https://${SERVER}/login
${WELCOME URL}    https://${SERVER}/
${ERROR URL}      https://${SERVER}/login
${FORGOT URL}     https://${SERVER}/forgot-password
${HOME URL}       https://dxt360.sonarplatform.com



*** Keywords ***

Open Browser To Switch App Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Switch App Page Should Be Open
    Set Selenium Speed    0
    Title Should Be    Switch App | DXT360 App

Dashboard Page Should Be Open
    Title Should Be    Dashboard | DXT 360 


Input Username
    [Arguments]    ${username} 
    Input Text    css:input[placeholder="Please enter your email Address"]   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css:input[placeholder="Please enter your password"]    ${password}

Wait Captcha
    Pause Execution             Enter captcha

Submit Credentials
    # Set Selenium Speed    ${DELAY}
    Submit Form        //form


Welcome Page Should Be Open
    Title Should Be    Switch App | DXT360 App

Forgot Password Page Should Be Open
    Location Should Be    ${FORGOT URL}
    Title Should Be    Forgot Password | DXT360 App

Click Open App
    Click Button    //button[text=]