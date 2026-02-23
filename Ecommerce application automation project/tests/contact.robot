*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${CONTACT_US_BTN}     xpath=//a[contains(text(),'Contact us')]
${GET_IN_TOUCH_TEXT}  xpath=//h2[contains(text(),'Get In Touch')]

${NAME_INPUT}         name=name
${EMAIL_INPUT}        name=email
${SUBJECT_INPUT}      name=subject
${MESSAGE_INPUT}      id=message

${FILE_UPLOAD}        name=upload_file
${SUBMIT_BTN}         xpath=//input[@data-qa='submit-button']

${SUCCESS_MSG}        xpath=//div[contains(text(),'Success! Your details have been submitted successfully.')]
${HOME_BTN}           xpath=//a[contains(text(),'Home')]

${FILE_PATH}          C:/Users/LENOVO/Desktop/selenium with python wipro/tt.png

*** Keywords ***
Switch To Main Window
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[0]

Verify Home Page Visible
    Wait Until Element Is Visible    xpath=//img[@alt='Website for automation practice']    10s
*** Test Cases ***
Submit Contact Us Form Successfully
    Open Browser To Website
    Switch To Main Window
    Verify Home Page Visible

    Click Element    ${CONTACT_US_BTN}

    Wait Until Element Is Visible    ${GET_IN_TOUCH_TEXT}    10s

    Input Text    ${NAME_INPUT}      Test User
    Input Text    ${EMAIL_INPUT}     testuser@mail.com
    Input Text    ${SUBJECT_INPUT}   Testing Contact Form
    Input Text    ${MESSAGE_INPUT}   This is a test message

    Choose File    ${FILE_UPLOAD}    ${FILE_PATH}

    Scroll Element Into View    ${SUBMIT_BTN}
    Click Button    ${SUBMIT_BTN}
    Sleep    5s

    Handle Alert    action=ACCEPT       timeout=5s

    Wait Until Element Is Visible    ${SUCCESS_MSG}    10s

    Click Element    ${HOME_BTN}
    Verify Home Page Visible
    Sleep    5s

    Close Browser Session