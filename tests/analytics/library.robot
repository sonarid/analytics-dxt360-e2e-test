*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          open_analytics.robot
Resource          ../login/valid_login.robot


*** Keywords ***


Click Library Sidebar Button
    Click Element    //aside/nav/ul/li[3]
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]
    Location Should Be    ${HOME URL}/library
    Wait Until Page Contains Element    //title[text()="Campaign Library | DXT 360"]
    Title Should Be    Campaign Library | DXT 360

*** Test Cases ***

Check Search
    Valid Switch App
    Click Library Sidebar Button
    [Teardown]     Close Browser
    