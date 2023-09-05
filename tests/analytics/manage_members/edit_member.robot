*** Settings ***
Documentation      Test for Edit Member Trial User
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Resource          manage_member.resource
*** Variables ***
${USER NAME}        testing robot
${EDITED NAME}      edited robot
${EDITED TYPE}      Full User
${siapa}    Arnold Harits
${APP NAME}    DXT360 Analytics
${CAMPAIGN NAME}    Kartu Hallo
${ACCESS PERMISSION}    Edit sentiment
${DASHBOARD LIMIT}    5

*** Keywords ***
Click View User
    [Arguments]    ${user}
    Click Element    //td/*[text()="${user}"]/parent::td/following-sibling::td[5]/div/div/button[1]

Manage Profile
    [Arguments]    ${user_type}    ${edited user name}
    Click Button    //*[text()="Manage Profile"]
    Click Element    //*[text()="Full User"]
    Input Text    //*[@placeholder="User Name"]    ${edited user name}
    Wait Until Page Contains Element    //button[text()='Save' and not(@disabled='')]
    # CODE TO CLICK BUTTON SAVE HERE
    
    # DELETE THIS IF YOU CLICKED THE SAVE BUTTON
    Click Element    //*[text()="Back to Account Setting"]

Manage Password
    [Arguments]    ${new_password}
    Click Element    //a[text()="Password"]
    Click Element    //*[text()="Change Password"]
    Input Text    //*[@placeholder="Please enter the password"]    ${new_password}
    Input Text    //*[@placeholder="Please enter the confirm password"]    ${new_password}
    Wait Until Page Contains Element    //button[text()='Save' and not(@disabled='')]
    # CODE TO CLICK BUTTON SAVE HERE
    
    # DELETE THIS IF YOU CLICKED THE SAVE BUTTON
    Click Element    //*[text()="Back to User Details"]
    Click Element    //*[text()="Leave"]

Manage Settings And Accessibility
    Click Element    //a[text()="Settings & Accessibility"]
    Wait Until Location Contains    settings
    Wait Until Page Contains Element    //*[text()="${app_name}"]
    Deactivate App        ${APP NAME}    ${siapa}
    Manage App Accessibility    ${ACCESS PERMISSION}
    Manage Dashboard Limit    ${DASHBOARD LIMIT}
    

Deactivate App
    [Arguments]    ${app_name}    ${nama pengguna}
    Click Element    //div[@class="flex items-center gap-2 py-1"]//*[text()="${app_name}"]/ancestor::div[@class="flex items-center gap-2 py-1"]/following-sibling::div/*[text()="Deactive"]
    Page Should Contain Element    //*[text()="${nama pengguna} will no longer be able to access DXT360 Analytics."]
    Page Should Contain Button    //*[text()="Yes, Deactivate"]
    # CODE TO CLICK DEACTIVE BUTTON HERE
   
    # DELETE THIS IF YOU CLICKED THE SAVE BUTTON
    Click Element    //*[text()="Cancel"]

Manage App Accessibility
    [Arguments]    ${permission}
    Click Element    //div[@class="flex items-center gap-2 py-1"]//*[text()="${app_name}"]/ancestor::div[@class="flex items-center gap-2 py-1"]/following-sibling::div//*[text()="Settings"]
    Wait Until Location Contains    app
    Select Campaign    ${CAMPAIGN NAME}
    Select Dashboard
    Click Element    //*[text()="${permission}"]
    Page Should Contain Button    //*[text()="Save"]
    # CODE TO CLICK DEACTIVE BUTTON HERE
   
    # DELETE THIS IF YOU CLICKED THE SAVE BUTTON
    Click Element    //*[text()="Back to User Details"]

Manage Dashboard Limit
    [Arguments]    ${limit}
    ${check_value}=    Get Element Attribute    //*[text()="Set Dashboard Limit"]/following-sibling::button    aria-checked
    IF    "${check_value}" == "false"
        Click Element    //*[text()="Set Dashboard Limit"]/following-sibling::button
        Input Text    //*[@placeholder="Input dashboard limit"]   ${limit} 
    ELSE
        Input Text    //*[@placeholder="Input dashboard limit"]   ${limit} 
    END

    Click Element    //*[text()="Save"]

Disable Dashboard Limit
    ${check_value}=    Get Element Attribute    //*[text()="Set Dashboard Limit"]/following-sibling::button    aria-checked
    IF    "${check_value}" == "true"
        Click Element    //*[text()="Set Dashboard Limit"]/following-sibling::button
    END

*** Test Cases ***
Edit Member
    Valid Switch App 
    Open Manage Members
    Click Kebab    ${USER NAME}
    Click View User    ${USER NAME}
    Manage Profile    ${EDITED TYPE}    ${EDITED NAME}
    Manage Password    ${VALID PASSWORD}
    Manage Settings And Accessibility
