*** Settings ***
Documentation     Test for Adding New Alerts
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
# Resource          alerts.robot
Library    XML

*** Keywords ***
Click Add Alert
    Click Element    //a[@href="/alerts/new/step-1"]
    Wait Until Location Contains    new/step-1

Select Alert Type
    Input Text          //input[@placeholder="Please enter the alert name"]    Testing Robot
    Click Element       //label[text()="Based on Keywords"]
    Click Button        //button[text()="Continue to Filtering"]
    Wait Until Location Does Not Contain    step-1

Select Alert Filtering
    

    Click Element                       //input[@placeholder="Please select the sentiment"]
    Click Element                       //div/span[text()="Positive"]/parent::div
    Press Keys                          None   ESC

    Click Element                       //input[@placeholder="Please select the campaign"]
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/span[text()="Toyota"]/parent::div
    Press Keys                          None   ESC

    Click Element                       //input[@placeholder="Please select the source"]
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/span[text()="Forums"]
    Press Keys                          None   ESC

    Click Element                       //span[text()="Please select the keyword"]
    # Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]    
    Click Element                       //button[text()="telkom"]
    Press Keys                          None   ESC

    Input Text                          //label/following-sibling::input        200

    Click Button                        //button[text()="Continue to Interval"]
    Wait Until Location Does Not Contain    step-2

Select Alert Interval
    Click Element    //label[text()="Time Interval"]
    Wait Until Page Contains Element    //div[@role="radiogroup"]
    Click Element    //span[text()="30 Minutes"]

    Click Button    //button[text()="Continue to Set Contact"]
    Wait Until Location Does Not Contain    step-3

Select Alert Contact
    Click Element    //input[@placeholder="Please select user email"]
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //p[text()="alertdxt.email.testing@gmail.com"]
    Press Keys        None   ESC

    Click Element    //input[@placeholder="Please select LINE account"]
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //p[text()="Alert Line 22"]
    Press Keys        None   ESC
    
    Input Text       //input[@placeholder="Group Name"]        Testing Robot
    
    # TODO: Bug dropdown not showing
    Click Button    //label[text()="Enter Admin WhatsApp Number"]/following-sibling::div/button
    Click Button    //label[text()="Enter Admin WhatsApp Number"]/following-sibling::div/button
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //span[text()="Mrson"]
    Press Keys        None   ESC
    
    Click Button    //button[text()="Continue to Confirm"]
    Wait Until Location Does Not Contain    step-4

Check If Alert Data is Correct
    [Arguments]
    SeleniumLibrary.Element Text Should Be    //label[text()="Alert Name"]/following-sibling::p    Testing Robot
    SeleniumLibrary.Element Text Should Be    //label[text()="Interval"]/following-sibling::p    30 Minutes
    SeleniumLibrary.Element Text Should Be    //label[text()="Alert Type"]/following-sibling::div/div/span    Keywords
    SeleniumLibrary.Element Text Should Be    //label[text()="Sentiment"]/following-sibling::div/div/span    Positive
    SeleniumLibrary.Element Text Should Be    //label[text()="Campaign"]/following-sibling::div/div/span    Toyota
    SeleniumLibrary.Element Text Should Be    //div/span[text()="Email"]/parent::div/following-sibling::div/span    alertdxt.email.testing@gmail.com
    SeleniumLibrary.Element Text Should Be    //div/span[text()="Line"]/parent::div/following-sibling::div/span    Alert Line 22
    SeleniumLibrary.Element Text Should Be    //div/span[text()="WA Group Name"]/parent::div/following-sibling::div/span    Testing Robot
    SeleniumLibrary.Element Text Should Be    //div/span[text()="WA Group Admin"]/parent::div/following-sibling::div/span    +6287880780733

*** Test Cases ***
Add Alert
    Valid Switch App
    Click Sidebar Navigation Button   //aside/nav/ul/li[5]    Alerts | DXT 360    alerts
    Click Add Alert
    Select Alert Type
    Select Alert Filtering
    Select Alert Interval
    Select Alert Contact
    Check If Alert Data is Correct
