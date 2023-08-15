** Settings ***
Documentation      Test for Dashboard Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource
*** Keywords ***
Open Manage Members
    Click Element    //div/div/span[@style="font-size: 14px;"]/parent::div
    Click Element    //a[@href="/users"]
    Wait Until Location Contains    users
    Click Button    //button[text()="Add User"]

*** Test Cases ***
Check Dashboard
    Valid Switch App    
    Open Manage Members