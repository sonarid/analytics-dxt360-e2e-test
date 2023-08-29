*** Settings ***
Documentation      Test for Adding Member Full User
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Resource          manage_member.resource

*** Keywords ***
Open Add Member
    Click Button    //button[text()="Add User"]
    Wait Until Location Contains    add    10

Input User Information
    Click Element    //h5[text()="Full User"]
    Input Text    //input[@placeholder="Please enter the name"]    Testing Robot
    Input Text    //input[@placeholder="Please enter the email"]    testingrobot@gmail.com
    Input Text    //input[@placeholder="81230456765"]    81230456765
    Input Text    //input[@placeholder="Please enter the password"]    ${VALID PASSWORD}
    Input Text    //input[@placeholder="Please enter the confirm password"]    ${VALID PASSWORD}
    Click Button    //button[text()="Continue to App Activation"]
    Wait Until Location Contains    app-activation    10

Select Activated Apps
    # @TODO: Bug cant clik on locator based on "DXT360 Analytics" text()
    Click Element    //*[text()="DXT360 Analytics"]/preceding-sibling::input
    Click Element    //*[text()="Edit sentiment"]

*** Test Cases ***
Add Member Full
    Valid Switch App 
    Open Manage Members
    Open Add Member
    Input User Information
    Select Activated Apps