** Settings ***
Documentation      Test for Adding Member Trial User
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
*** Keywords ***
Open Manage Members
    Click Element    //div/div/span[@style="font-size: 14px;"]/parent::div
    Set Selenium Implicit Wait    1
    Click Element    //a[@href="/users"]
    Wait Until Location Contains    users    10
    Click Element    //*[@placeholder="Search"]

Open Add Member
    Click Button    //button[text()="Add User"]
    Wait Until Location Contains    add    10

Input User Information
    Click Element    //h5[text()="Trial User"]
    Input Text    //input[@placeholder="Please enter the name"]    Testing Robot
    Input Text    //input[@placeholder="Please enter the email"]    testingrobot@gmail.com
    Input Text    //input[@placeholder="81230456765"]    81230456765
    Input Text    //input[@placeholder="Please enter the password"]    ${VALID PASSWORD}
    Input Text    //input[@placeholder="Please enter the confirm password"]    ${VALID PASSWORD}
    Click Button    //button[text()="Continue to App Activation"]
    Wait Until Location Contains    app-activation    10

Select Activated Apps
    # @TODO: Bug cant clik on locator based on "DXT360 Analytics" text()
    Click Element    //div[@class="px-4 py-3 flex items-center"]/input
    Click Element    //*[text()="Edit sentiment"]

*** Test Cases ***
Check Dashboard
    Valid Switch App 
    Open Manage Members
    Open Add Member
    Input User Information
    Select Activated Apps