*** Settings ***
Library    SeleniumLibrary
Library     String
Resource   locators.robot

*** Keywords ***

Open Browser To Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Click Signup Login
    Click Element    ${SIGNUP_LOGIN_BTN}

Verify Login Page Visible
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}    10s

Login User
    [Arguments]    ${email}    ${password}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BTN}

Close Browser Session
    Close Browser


Verify Home Page Visible
    Title Should Be    Automation Exercise

Verify New User Signup Visible
    Element Should Be Visible    ${NEW_USER_TEXT}

Enter Name And Email
#    ${random}=    Generate Random String    5
#    ${email}=    Set Variable    test${random}@mail.com
    Input Text    ${NAME_INPUT}    Shiv
    Input Text    ${NEWUSER_EMAIL_INPUT}    shiv123123@gmail.com  #${email}

Click Signup Button
    Scroll Element Into View    ${SIGNUP_BTN}
    Wait Until Element Is Visible    ${SIGNUP_BTN}    10s
    Click Button    ${SIGNUP_BTN}

Verify Account Info Visible
    Wait Until Element Is Visible    ${ACCOUNT_INFO_TEXT}    10s

Fill Account Details
    Click Element    ${TITLE}
    Input Text    ${PASSWORD}    Password123
    Select From List By Value    ${DAY}    10
    Select From List By Value    ${MONTH}    5
    Select From List By Value    ${YEAR}    1998

Select Newsletter And Offers
    Select Checkbox    ${NEWSLETTER}
    Select Checkbox    ${OFFERS}

Fill Address Details
    Input Text    ${FIRSTNAME}    Test
    Input Text    ${LASTNAME}    User
    Input Text    ${COMPANY}    TestCompany
    Input Text    ${ADDRESS1}    Address Line 1
    Input Text    ${ADDRESS2}    Address Line 2
    Select From List By Label    ${COUNTRY}    India
    Input Text    ${STATE}    UP
    Input Text    ${CITY}    Lucknow
    Input Text    ${ZIP}    226001
    Input Text    ${MOBILE}    9999999999

Click Create Account
    Click Button    ${CREATE_ACCOUNT}

Verify Account Created
    Element Should Be Visible    ${ACCOUNT_CREATED}

Click Continue
    Click Element    ${CONTINUE_BTN}

Verify Logged In
    Element Should Be Visible    ${LOGGED_IN}


