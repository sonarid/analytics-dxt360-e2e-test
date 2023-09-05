*** Settings ***
Documentation     Test for Adding New Alerts by Buzz Threshold
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../resources/general.resource
Resource          ../../../resources/analytics_page.resource
Resource          add_alert.resource
Library    XML

*** Keywords ***

Select Alert Filtering
    
    Select Sentiment    Positive
    Select Campaign    Toyota
    Select Source    Forums
    Input Buzz Count    200
    Click Continue Button

Select Alert Interval
    
    Select Interval    30 Minutes
    Click Continue Button

Select Alert Contact

    Select User Email    alertdxt.email.testing@gmail.com
    Select Line Account    Alert Line 22
    Input Group Name    Testing Robot
    Select Admin WhatsApp Name    Mrson
    Click Continue Button


Check If Alert Data is Correct
    
    Check Single Alert Data    Alert Name    Testing Robot Buzz
    Check Single Alert Data    Interval    30 Minutes
    Check Multiple Alert Data    Alert Type    Buzz Threshold
    Check Multiple Alert Data    Sentiment    Positive
    Check Multiple Alert Data    Campaign    Toyota
    Check Contact Alert Data    Email    alertdxt.email.testing@gmail.com
    Check Contact Alert Data    Line    Alert Line 22
    Check Contact Alert Data    WA Group Name    Testing Robot
    Check Contact Alert Data    WA Group Admin    Mrson

*** Test Cases ***
Add Alert by Keyword
    Valid Switch App
    Click Sidebar Navigation Button   //aside/nav/ul/li[5]    Alerts | DXT 360    alerts
    Click Add Alert
    Select Alert Type    Testing Robot Buzz    Buzz Threshold
    Click Continue Button 
    Select Alert Filtering
    Select Alert Interval
    Select Alert Contact
    Check If Alert Data is Correct
    [Teardown]     Close Browser