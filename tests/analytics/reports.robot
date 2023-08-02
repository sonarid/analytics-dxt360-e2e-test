*** Settings ***
Documentation      Test for Reports Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***
Click Reports Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[6]    Insight Report | DXT 360    reports/insight-report

*** Test Cases ***

Check Reports
    Valid Switch App
    Click Reports Sidebar Button
    [Teardown]     Close Browser
    