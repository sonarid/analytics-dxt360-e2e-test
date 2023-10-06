*** Settings ***
Documentation     test analytics
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          general.resource
Resource          login_page.resource
*** Keywords ***
Valid Switch App
    Valid Login
    # Welcome Page Should Be Open
    Wait Until Page Contains Element    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button    10
    Click Button    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button
    Wait Until Page Does Not Contain Element    //title[text()="Loading ... | DXT 360"]    10
    Dashboard Page Should Be Open

Valid Switch CX App
    Valid Login cx
    # Welcome Page Should Be Open
    Wait Until Page Contains    Mrson    20
    Choose Client CX
    Wait Until Page Contains Element    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button    10
    Click Button    //div/div/h3[text()="DXT360 Analytics"]/parent::div/following-sibling::div[1]/button
    Wait Until Page Does Not Contain Element    //title[text()="Loading ... | DXT 360"]    10
    Dashboard Page Should Be Open


Click Sidebar Navigation Button cx
    [Arguments]    ${page_button_locator}    ${page_title}    ${url_suffix} 
    Click Element    ${page_button_locator}
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]    10
    Location Should Be    ${HOME URL}/${url_suffix}
    Wait Until Page Contains Element    //title[text()="${page_title}"]    10
    Title Should Be    ${page_title}

    

Click Sidebar Navigation Button
    [Arguments]    ${page_button_locator}    ${page_title}    ${url_suffix} 
    Click Element    ${page_button_locator}
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]    20
    Location Should Be    ${HOME URL}/${url_suffix}
    Wait Until Page Contains Element    //title[text()="${page_title}"]    20
    Title Should Be    ${page_title}

Click Periode Button
    [Arguments]    ${periode}   #${title_date}
    #Click Element ${page_button_locattor}
    Click Element   //h3[text()="Period"]/following-sibling::div/div/*[text()="${periode}"]
    #Wait Until Page Contains Element   //*[text()="${title_date}"]    20 

Check Post data
    [Arguments]    ${titlepost}
    Wait Until Page Contains Element   //*[text()="${titlepost}"]    20

Click Channel Button
    [Arguments]      ${Twitter}  
    Click Element    //button[text()="${Twitter}"]




    