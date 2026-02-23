*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../resources/keywords.robot
Resource    ../resources/locators.robot

*** Variables ***
${NEW_USER_TEXT}    xpath=//h2[text()='New User Signup!']
${NAME_INPUT}    name=name
${NEWUSER_EMAIL_INPUT}      xpath://input[@data-qa='signup-email']
${SIGNUP_BTN}    xpath=//button[@data-qa='signup-button']


#${ACCOUNT_INFO_TEXT}    xpath://b[normalize-space()='Enter Account Information']
${TITLE}    id=id_gender1
${PASSWORD}    id=password
${DAY}    id=days
${MONTH}    id=months
${YEAR}    id=years
${NEWSLETTER}    id=newsletter
${OFFERS}    id=optin
${FIRSTNAME}    id=first_name
${LASTNAME}    id=last_name
${COMPANY}    id=company
${ADDRESS1}    id=address1
${ADDRESS2}    id=address2
${COUNTRY}    id=country
${STATE}    id=state
${CITY}    id=city
${ZIP}    id=zipcode
${MOBILE}    id=mobile_number
${CREATE_ACCOUNT}    xpath=//button[@data-qa='create-account']
${ACCOUNT_CREATED}    xpath=//b[text()='Account Created!']
${CONTINUE_BTN}    xpath=//a[@data-qa='continue-button']
${LOGGED_IN}    xpath=//a[contains(text(),'Logged in as')]

*** Test Cases ***

Register User Successfully
    Open Browser To Website
    Verify Home Page Visible
    Click Signup Login
    Verify New User Signup Visible
    Enter Name And Email
    Click Signup Button
    Sleep    3s
    #Wait Until Element Is Visible    xpath://b[normalize-space()='Enter Account Information']
    Verify Account Info Visible
    Fill Account Details
    Select Newsletter And Offers
    Fill Address Details
    Click Create Account
    Sleep    3s
    Verify Account Created
    Click Continue
    Sleep    2s
    Verify Logged In
    Sleep    2s
    Close Browser Session