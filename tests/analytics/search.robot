*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          open_analytics.robot
Resource    ../login/valid_login.robot


*** Keywords ***
Click Search Sidebar Button
    Set Selenium Speed    0.5
    Click Element    //aside/nav/ul/li[2]
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]
    Title Should Be    Search | DXT 360

*** Test Cases ***

Check Search
    Valid Switch App
    Click Search Sidebar Button
    [Teardown]     Close Browser
    