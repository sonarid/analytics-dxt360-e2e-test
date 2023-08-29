*** Settings ***
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