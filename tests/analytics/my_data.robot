*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          open_analytics.robot
Resource          ../login/valid_login.robot


*** Keywords ***



Click My Data Sidebar Button
    Click Element    //aside/nav/ul/li[4]
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]
    Location Should Be    ${HOME URL}/raw-data
    Wait Until Page Contains Element    //title[text()="Raw Data | DXT 360"]
    Title Should Be    Raw Data | DXT 360

*** Test Cases ***

Check Search
    Valid Switch App
    Click My Data Sidebar Button
    [Teardown]     Close Browser
    