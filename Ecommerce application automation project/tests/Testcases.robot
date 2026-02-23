*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${TEST_CASES_BTN}       xpath=//a[contains(text(),'Test Cases')]
${TEST_CASES_HEADER}        xpath=//b[contains(text(),'Test Cases')]

*** Keywords ***
Switch To Main Window
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[0]

*** Test Cases ***
Verify Test Cases Page
    Open Browser To Website
    #Switch To Main Window
    Verify Home Page Visible

    Click Element    ${TEST_CASES_BTN}

    Wait Until Element Is Visible    ${TEST_CASES_HEADER}    10s

    Close Browser Session