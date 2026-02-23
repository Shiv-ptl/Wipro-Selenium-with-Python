*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${NAME_INPUT}        name=name
${EMAIL_INPUT}       xpath=//input[@data-qa='signup-email']
${SIGNUP_BTN}        xpath=//button[@data-qa='signup-button']
${NEW_USER_TEXT}     xpath=//h2[contains(text(),'New User Signup!')]
${EXISTING_EMAIL_ERROR}    xpath=//p[contains(text(),'Email Address already exist!')]

${EXISTING_EMAIL}    shiv123123@gmail.com

*** Test Cases ***
Register User With Existing Email
    Open Browser To Website
    Verify Home Page Visible

    Click Signup Login
    Wait Until Element Is Visible    ${NEW_USER_TEXT}    10s

    Input Text    ${NAME_INPUT}    TestUser
    Input Text    ${EMAIL_INPUT}   ${EXISTING_EMAIL}

    Click Button    ${SIGNUP_BTN}

    Wait Until Element Is Visible    ${EXISTING_EMAIL_ERROR}    10s

    Close Browser Session