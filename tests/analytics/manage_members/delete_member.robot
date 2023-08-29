*** Settings ***
Documentation      Test for Delete Member Trial User
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Library    XML
Resource          manage_member.resource
*** Variables ***
${USER NAME}        testing robot

*** Keywords ***


Click Delete
    [Arguments]    ${user}
    Click Element    //td/*[text()="${user}"]/parent::td/following-sibling::td[5]/div/div/button[2]
    Page Should Contain Element    //h5[contains(text(), 'Are you sure you want to delete "${user}" user')]

Input Password To Confirm
    [Arguments]    ${password}
    Input Text    //*[@placeholder="Please enter your password"]    ${password}
    Wait Until Page Contains Element    //button[text()='Yes, Delete' and not(@disabled='')]

       
*** Test Cases ***
Delete Member
    Valid Switch App 
    Open Manage Members
    Click Kebab    ${USER NAME}
    Click Delete    ${USER NAME}
    Input Password To Confirm    ${VALID PASSWORD}

