*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/locators.robot

*** Variables ***
${LOGOUT_BTN}        xpath=//a[contains(text(),'Logout')]
${LOGIN_PAGE_TEXT}   xpath=//h2[contains(text(),'Login to your account')]
${LOGGED_IN_TEXT}    xpath=//a[contains(text(),'Logged in as')]
${LOGIN_BTN}         xpath=//button[@data-qa='login-button']
${LOGIN_PASSWORD_INPUT}     xpath=//input[@data-qa='login-password']
${LOGIN_EMAIL_INPUT}        xpath=//input[@data-qa='login-email']

*** Keywords ***
Enter Correct Credentials
    Input Text    ${LOGIN_EMAIL_INPUT}      shiv123123@gmail.com
    Input Text    ${LOGIN_PASSWORD_INPUT}   Password123

Verify Logged In Visible
    Wait Until Element Is Visible    ${LOGGED_IN_TEXT}    10s

Click Logout Button
    Scroll Element Into View    ${LOGOUT_BTN}
    Wait Until Element Is Visible    ${LOGOUT_BTN}    10s
    Click Element    ${LOGOUT_BTN}

Verify Navigated To Login Page
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}    10s

*** Test Cases ***
Logout User Successfully
    Open Browser To Website
    Verify Home Page Visible
    Click Signup Login
    Verify Login Page Visible
    Enter Correct Credentials
    Click Element    ${LOGIN_BTN}
    Verify Logged In Visible
    Click Logout Button
    Verify Navigated To Login Page
    Close Browser Session