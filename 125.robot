*** Settings ***
Documentation    Suite description
Library     Selenium2Library

*** Variables ***
${shipment_id}         default_circuit_id


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Open Browser    https://www.track-trace.com/aircargo   headlesschrome      ##PROD
    Maximize Browser Window
    Sleep    4s
    Click Button    //button[@class='tingle-btn tingle-btn--primary']
    Input Text    //input[@id='number']    ${shipment_id}
    Click Button    //div[@id='vue-multi-form']//div[3]//input[1]
    Sleep    15s
    ${status}=   Get Text    xpath=//div[@class='timelinecontainer']//div[1]//div[2]//div[1]//h3[1]
    ${current_remarks}=  Get Text    xpath=//body[1]/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]
    ${status_string}=    Get Location
    #send to DB  ${shipment_id}  ${status}  ${current_remarks}  ${status_string}
    log to console   ${status}
    log to console   ${current_remarks}
    log to console   ${status_string}
    Close Browser
