*** Settings ***
Documentation     Resource for Adding Alert
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource

*** Keywords ***
Click Add Alert
    Click Element    //a[@href="/alerts/new/step-1"]
    Wait Until Location Contains    new/step-1


Select Alert Type
    [Arguments]    ${alert_name}    ${alert_type}    
    Input Text          //*[@placeholder="Please enter the alert name"]    ${alert_name}
    Click Element       //*[text()="Based on ${alert_type}"]
    # Click Button        //button[text()="Continue to Filtering"]
    # Wait Until Location Does Not Contain    step-1    10

Click Continue Button
    ${button_text}=    Set Variable    ${None}
    ${curr_location}=    Get Location    
    ${rest_location}    ${curr_step}    Split String From Right    ${curr_location}    /    1
    IF    "${curr_step}" == "step-1"
        ${button_text}     Set Variable    Filtering
    END
    IF    "${curr_step}" == "step-2"
        ${button_text}     Set Variable    Interval
    END
    IF    "${curr_step}" == "step-3"
        ${button_text}     Set Variable    Set Contact
    END
    IF    "${curr_step}" == "step-4"
        ${button_text}     Set Variable    Confirm
    END
    Click Button    //button[text()="Continue to ${button_text}"]
    Wait Until Location Does Not Contain    ${curr_step}    10

Select Sentiment
    [Arguments]    ${sentiment}
    Click Element                       //*[@placeholder="Please select the sentiment"]
    Click Element                       //div/*[text()="${sentiment}"]/parent::div
    Press Keys                          None   ESC

Select Campaign
    [Arguments]    ${campaign}
    Click Element                       //*[@placeholder="Please select the campaign"]
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/*[text()="${campaign}"]/parent::div
    Press Keys                          None   ESC

Select Source
    [Arguments]    ${source}
    Click Element                       //*[@placeholder="Please select the source"]
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/*[text()="${source}"]
    Press Keys                          None   ESC

Select Keyword
    [Arguments]    ${keyword}
    Click Element                       //span[text()="Please select the keyword"]
    Click Element                       //button[text()="${keyword}"]
    Press Keys                          None   ESC

Select Type
    [Arguments]    ${type}
    Click Element                       //input[@placeholder="Please select the type"]
    Wait Until Page Contains Element    //div[@class="grid grid-cols-3 gap-3"]
    Click Element                       //div/span[text()="${type}"]
    Press Keys                          None   ESC
Input Buzz Count
    [Arguments]    ${buzz_count}   
    Input Text                          //*/following-sibling::input        ${buzz_count}

Select Interval
    [Arguments]    ${time_interval}
    Click Element    //*[text()="Time Interval"]
    Wait Until Page Contains Element    //div[@role="radiogroup"]
    Click Element    //*[text()="${time_interval}"]

Select User Email
    [Arguments]    ${user_email}
    Click Element    //input[@placeholder="Please select user email"]
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //p[text()="${user_email}"]
    Press Keys        None   ESC

Select Line Account
    [Arguments]    ${line_account}
    Click Element    //input[@placeholder="Please select LINE account"]
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //p[text()="${line_account}"]
    Press Keys        None   ESC

Input Group Name
    [Arguments]    ${group_name}
    Input Text       //input[@placeholder="Group Name"]        ${group_name}

# TODO: Bug dropdown not showing on first click
Select Admin WhatsApp Name
    [Arguments]    ${admin_name}
    Click Button    //*[text()="Enter Admin WhatsApp Number"]/following-sibling::div/button
    Click Button    //*[text()="Enter Admin WhatsApp Number"]/following-sibling::div/button
    Click Button    //*[text()="Enter Admin WhatsApp Number"]/following-sibling::div/button
    Wait Until Page Contains Element    //li[@role="option"]
    Click Element    //li/*[text()="${admin_name}"]/parent::li
    Press Keys        None   ESC

Check Single Alert Data
    [Arguments]    ${label}    ${data}
    SeleniumLibrary.Element Text Should Be    //*[text()="${label}"]/following-sibling::p    ${data}

Check Multiple Alert Data
    [Arguments]    ${label}    ${data}
    SeleniumLibrary.Element Text Should Be    //*[text()="${label}"]/following-sibling::div/div/span    ${data}

Check Contact Alert Data
    [Arguments]    ${label}    ${data}
    SeleniumLibrary.Element Text Should Be    //div/*[text()="${label}"]/parent::div/following-sibling::div/span    ${data}

Set Active State
    [Arguments]    ${alert_name}    ${active_state}
    Wait Until Page Contains Element    //table
    Click Element    //*[@placeholder="Search"] 
    ${curr_active_state}=    Get Text    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[5]/span
    Click Element    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[6][@class="p-3 align-top"]/button
    IF    "${active_state}" == "Active"
        Click Element    //*[text()="Set to Active"]
    ELSE
        Click Element    //*[text()="Set to Inactive"]
    END
    Click Element    //*[@placeholder="Search"] 
    Input Text    //*[@placeholder="Search"]     ${alert_name}
    Wait Until Page Contains Element    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[5]/span[text()="${active_state}"]    10
    Element Text Should Be    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[5]/span    ${active_state}
       
Revert Active State   
    [Arguments]    ${alert_name}
    Click Element    //*[@placeholder="Search"] 
    ${curr_active_state}=    Get Text    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[5]/span
    Click Element    //td/a[text()="${alert_name}"]/parent::td/following-sibling::td[6][@class="p-3 align-top"]/button
    IF    "${curr_active_state}" == "Active"
        Click Element    //*[text()="Set to Inactive"]
    ELSE
        Click Element    //*[text()="Set to Active"]
    END
    Click Element    //*[@placeholder="Search"] 
