*** Settings ***
Documentation      Test for Adding Member Trial User
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource

*** Keywords ***
Open Manage Members
    Click Element    //div/div/span[@style="font-size: 14px;"]/parent::div
    Set Selenium Implicit Wait    1
    Click Element    //a[@href="/users"]
    Wait Until Location Contains    users    10
    Click Element    //*[@placeholder="Search"]

Click Kebab
    [Arguments]    ${user}
    Wait Until Page Contains Element    //tr    10
    Click Element    //td/*[text()="${user}"]/parent::td/following-sibling::td[5]/div/button

Select Campaign
    [Arguments]    ${campaign}
    Click Element                       //h4[text()="Campaigns"]/following-sibling::div
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/*[text()="${campaign}"]/parent::div
    Press Keys                          None   ESC

Select Dashboard
    # [Arguments]    ${dashboard}
    Click Element                       //h4[text()="Dashboard"]/parent::div/following-sibling::div
    Wait Until Page Contains Element    //*[text()="Dashboard (Specific User Type)"]/following-sibling::div/li
    Press Keys                          None   ESC
