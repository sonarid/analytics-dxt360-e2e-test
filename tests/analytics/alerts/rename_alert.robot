*** Settings ***
Documentation     Test for Renaming Alerts by Keywords
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Resource          add_alert.resource
*** Variables ***
${CURRENT ALERT}    test20230803-c
${NEW ALERT}        robotNewAlertTest

*** Keywords ***
Rename Alert
    [Arguments]     ${curr_name}    ${new_name}
    Wait Until Page Contains Element    //table
    Click Element    //*[@placeholder="Search"]
    Click Element    //td/a[text()="${curr_name}"]/parent::td/following-sibling::td[6][@class="p-3 align-top"]/button
    Click Element    //*[text()="Rename"]
    Input Text    //*[@placeholder="Please enter your alert name"]    ${new_name}
    Page Should Contain Element    //*[text()="Yes, Rename"]
 

*** Test Cases ***
Set Active Alert
    Valid Switch App
    Click Sidebar Navigation Button   //aside/nav/ul/li[5]    Alerts | DXT 360    alerts
    Rename Alert    ${CURRENT ALERT}    ${NEW ALERT}
