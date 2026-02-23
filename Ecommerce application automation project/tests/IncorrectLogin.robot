*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/locators.robot

*** Variables ***
${LOGIN_PAGE_TEXT}    xpath=//h2[contains(text(),'Login to your account')]
${LOGIN_EMAIL_INPUT}    xpath=//input[@data-qa='login-email']
${LOGIN_PASSWORD_INPUT}    xpath=//input[@data-qa='login-password']
${LOGIN_BTN}    xpath=//button[@data-qa='login-button']
${LOGIN_ERROR}    xpath=//p[contains(text(),'Your email or password is incorrect!')]

*** Keywords ***
Verify Login Page Visible
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}    10s

Enter Incorrect Credentials
    Input Text    ${LOGIN_EMAIL_INPUT}    wronguser@test.com
    Input Text    ${LOGIN_PASSWORD_INPUT}    wrongpass123

Click Login Button
    Scroll Element Into View    ${LOGIN_BTN}
    Wait Until Element Is Visible    ${LOGIN_BTN}    10s
    Click Element    ${LOGIN_BTN}

Verify Login Error Message
    Wait Until Element Is Visible    ${LOGIN_ERROR}    10s

*** Test Cases ***
Login With Incorrect Credentials
    Open Browser To Website
    Verify Home Page Visible
    Click Signup Login
    Verify Login Page Visible
    Enter Incorrect Credentials
    Click Login Button
    Verify Login Error Message
    Close Browser Session