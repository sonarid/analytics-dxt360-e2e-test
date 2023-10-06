*** Settings ***
Documentation      Test for Generated Tempeleated Post Injection
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource


*** Keywords ***
Open Page Raw Data
    Click Sidebar Navigation Button   //aside/nav/ul/li[4]    Raw Data | DXT 360    raw-data

Waiting Page
    Wait Until Page Contains    Author & Source    20

Click Upload Button Post Injection      
    Wait Until Element Is Enabled    xpath://div[@class="transition-colors duration-200 border-2 border-base-300 hover:border-primary-600 rounded-lg text-primary-600 !font-medium p-3 cursor-pointer"]    10
    Click Element     //div[@class="transition-colors duration-200 border-2 border-base-300 hover:border-primary-600 rounded-lg text-primary-600 !font-medium p-3 cursor-pointer"]
    
#Feature on progress 
# Upload File Post Injection


*** Test Cases ***
Check My Data Page
    Valid Switch Cx App 
    Open Page Raw Data 
    Click Periode Button    Last 30D
    Waiting Page
    Click Channel Button    Online Media
    Click Upload Button Post Injection
   #Feteature on progress
    #Generated Templeate Post Injection
    [Teardown]     Close Browser
