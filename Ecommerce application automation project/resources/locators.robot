*** Settings ***

*** Variables ***

${URL}    https://automationexercise.com/
${BROWSER}    Chrome
${LOGIN_PAGE_TEXT}    xpath=//h2[contains(text(),'Login to your account')]
${SIGNUP_LOGIN_BTN}    xpath=//a[contains(text(),'Signup / Login')]
${EMAIL_INPUT}    name=email
${PASSWORD_INPUT}    name=password
${LOGIN_BTN}    xpath=//button[text()='Login']
${ACCOUNT_INFO_TEXT}    xpath=//b[text()='Enter Account Information']
${LOGGED_IN_TEXT}         xpath=//a[contains(text(),'Logged in as')]