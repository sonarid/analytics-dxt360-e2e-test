*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource 

*** Keywords ***
Valid Login
    Open Browser To Login Page
    Input Username    demo.analytics@dxt360.app
    general.Input Password    p3iN%u49
    # TODO: Captcha bypass
    Wait Captcha
    Submit Credentials        
    #  ${cookies}=    Get Cookies
    # # Save the cookies to a file
    # Create File    session_cookies.txt    ${cookies}

