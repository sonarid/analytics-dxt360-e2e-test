*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource    ../login/valid_login.robot
*** Keywords ***
Valid Switch App
    Valid Login
    # Welcome Page Should Be Open
    Wait Until Page Contains Element    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button    10
    Click Button    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button
    Wait Until Page Does Not Contain Element    //title[text()="Loading ... | DXT 360"]
    Dashboard Page Should Be Open
