*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource    ../login/valid_login.robot
Library            RPA.Cloud.Azure
*** Test Cases ***
Valid Switch App
    Valid Login
    # Welcome Page Should Be Open
    Click Button    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button