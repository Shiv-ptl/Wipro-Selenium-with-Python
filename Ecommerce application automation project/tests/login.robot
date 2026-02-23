*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/locators.robot

*** Keywords ***
Verify Logged In Visible
    Wait Until Element Is Visible    ${LOGGED_IN_TEXT}    10s

*** Test Cases ***

Login With Valid Credentials
    Open Browser To Website
    Verify Home Page Visible
    Click Signup Login
    #Verify Login Page Visible
    Login User    shiv123123@gmail.com    Password123
    Verify Logged In Visible
    Close Browser Session