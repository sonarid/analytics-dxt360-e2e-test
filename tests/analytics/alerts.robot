*** Settings ***
Documentation     Test for Alerts Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource



*** Keywords ***
Click Alerts Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[5]    Alerts | DXT 360    alerts

*** Test Cases ***

Check Alerts Page
    Valid Switch App
    Click Alerts Sidebar Button
    [Teardown]     Close Browser
    