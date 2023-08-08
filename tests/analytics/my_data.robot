*** Settings ***
Documentation      Test for My Data Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***



Click My Data Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[4]    Raw Data | DXT 360    raw-data

*** Test Cases ***
Check My Data Page
    Valid Switch App
    Click My Data Sidebar Button
    [Teardown]     Close Browser
    