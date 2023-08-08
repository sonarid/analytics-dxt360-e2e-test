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

Click Sidebar Navigation Button
    [Arguments]    ${page_button_locator}    ${page_title}    ${url_suffix} 
    Click Element    ${page_button_locator}
    Wait Until Page Does Not Contain Element    //title[text()="Dashboard | DXT 360"]
    Location Should Be    ${HOME URL}/${url_suffix}
    Wait Until Page Contains Element    //title[text()="${page_title}"]
    Title Should Be    ${page_title}     