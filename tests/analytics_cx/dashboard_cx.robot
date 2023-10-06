*** Settings ***
Documentation      Test for Dashboard Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***
Check Components
    ${dashboard_title}=    Get Dashboard Name
    Dashboard Title Should Be Same    ${dashboard_title}
    # Check Dashboard Components

# Login Flow
#     Valid Login
#     # Welcome Page Should Be Open
#     Wait Until Page Contains Element    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button    10
#     Click Button    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button
#     Wait Until Page Does Not Contain Element    //title[text()="Loading ... | DXT 360"]
#     Dashboard Page Should Be Open
    
Sidebar Components
    Page Should Contain Element    //div[@class="flex h-full flex-col justify-between"]/div[2]/a

Dashboard Title Should Be Same
    [Arguments]    ${dashboard_title}
    # TODO: Ganti "Dashboard - New Dahsboard Tst" ke variable
    Element Text Should Be    (//section/div/div/h1)    Dashboard - Sentiment Overview

Get Dashboard Name
    Get Text    //div[@class="flex justify-between w-[80%]"]/h1

# Check Dashboard Components
#     Page Should Contain Element    //div[@class="react-grid-layout layout z-0"]/div/section/div/div/div/span
*** Test Cases ***
Check Dashboard Cx  
    Valid Login cx 
    Wait Until Page Contains    Mrson
    Choose Client CX
    Wait Until Location Is Not    ${LOGIN URL}
    Switch App Page Should Be Open
    Check Components
    [Teardown]     Close Browser    