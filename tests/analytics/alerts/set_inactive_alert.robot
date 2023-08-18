*** Settings ***
Documentation     Test for Adding New Alerts by Keywords
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Resource          add_alert.resource

*** Test Cases ***
Set Inactive Alert
    Valid Switch App
    Click Sidebar Navigation Button   //aside/nav/ul/li[5]    Alerts | DXT 360    alerts
    Set Active State    test20230803-c    Inactive
    [Teardown]    Revert Active State    test20230803-c
