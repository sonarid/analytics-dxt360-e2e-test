*** Settings ***
Documentation      Test for My Data CX Page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../resources/general.resource
Resource          ../../resources/analytics_page.resource


*** Keywords ***
Open My Data Page
    Click Sidebar Navigation Button  //aside/nav/ul/li[4]    Raw Data | DXT 360    raw-data
  
Generated Templeated Post Injection
    Click Link    https://dxt360.sonarplatform.com/raw-data/upload?channel
    Wait Until Location Contains    Upload Data

*** Test Cases ***
Check Geneterated Templeated Post Injection Online Media
    Valid Switch CX App
    Open My Data Page
    Click Periode Button    Last 7D
    Click Channel Button   Online Media
    Open Upload Post Injection
    [Teardown]    Close Browser
    

    
    