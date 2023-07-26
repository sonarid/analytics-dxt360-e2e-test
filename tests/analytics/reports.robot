*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          open_analytics.robot
Resource          ../login/valid_login.robot


*** Keywords ***
Click Reports Sidebar Button
    Click Element    //aside/nav/ul/li[6]
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]
    Set Selenium Speed    0.5
    Location Should Be    ${HOME URL}/reports/raw-data
    Wait Until Page Contains Element    //title[text()="Raw Data Report | DXT 360"]
    Title Should Be    Raw Data Report | DXT 360

*** Test Cases ***

Check Search
    Valid Switch App
    Click Reports Sidebar Button
    [Teardown]     Close Browser
    