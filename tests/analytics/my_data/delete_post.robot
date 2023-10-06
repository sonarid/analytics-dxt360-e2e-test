*** Settings ***
Documentation      Test for My Data Page - deleted post
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource


*** Keywords ***
Click My Data Sidebar Button
    Click Sidebar Navigation Button   //aside/nav/ul/li[4]    Raw Data | DXT 360    raw-data
Selected post
    Click Element  //*[@id="__next"]/section/div/main/div[2]/div[2]/section/div[3]/div/div[1]/div[1]/button[3]
    Wait Until Element Is Visible    //*[@id="__next"]/section/div/main/div[2]/div[2]/section/div[3]/div/div[2]/table/tbody/tr[1]/td[2]/div[1]/div[2]/p


*** Test Cases ***
Verify deleted comment post functionalty
    Valid Switch App
    Click My Data Sidebar Button
    Click Periode Button    Last 30D
    Check Post data    Honda HR-V 1.8 EL ปี 2015
   [Teardown]     Close Browser
