*** Settings ***
Documentation      Test for Search Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***
Click Search Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[2]    Search | DXT 360    search

*** Test Cases ***

Check Search Page
    Valid Switch App
    Click Search Sidebar Button
    [Teardown]     Close Browser