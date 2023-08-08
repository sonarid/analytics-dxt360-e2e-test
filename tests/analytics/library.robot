*** Settings ***
Documentation      Test for Library Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***


Click Library Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[3]    Campaign Library | DXT 360    library

*** Test Cases ***

Check Library Page
    Valid Switch App
    Click Library Sidebar Button
    [Teardown]     Close Browser
    