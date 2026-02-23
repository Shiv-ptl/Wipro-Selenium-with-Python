*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${Url}      https://automationexercise.com/products
${PRODUCTS_BTN}        xpath=//a[contains(text(),'Products')]
${PRODUCT_LIST}        xpath=//div[@class='features_items']

${SEARCH_INPUT}        xpath=//input[@id='search_product']
${SEARCH_BTN}          xpath=//button[@id='submit_search']

${SEARCHED_HEADER}     xpath=//h2[contains(text(),'Searched Products')]
${SEARCH_RESULTS}      xpath=//div[@class='features_items']

${SEARCH_TEXT}         tshirt

*** Keywords ***
Switch To Main Window
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[0]

Close Ads If Present
    Run Keyword And Ignore Error    Execute Javascript    document.querySelectorAll('iframe').forEach(function(e){e.remove();});
    Run Keyword And Ignore Error    Execute Javascript    document.querySelectorAll("[id^='aswift']").forEach(function(e){e.remove();});

*** Test Cases ***
Search Product Successfully
        Open Browser        ${Url}      firefox
        #Switch To Main Window
        #Verify Home Page Visible

        #Click Element    ${PRODUCTS_BTN}
        Sleep    2s
        #Close Ads If Present
        #Reload Page
        Sleep    4s

        Wait Until Element Is Visible    ${PRODUCT_LIST}    15s

        #Close Ads If Present
        Scroll Element Into View    ${SEARCH_INPUT}
        Sleep    3s

        Input Text    ${SEARCH_INPUT}    ${SEARCH_TEXT}

        Click Element    xpath=//button[@id='submit_search']
        Scroll Element Into View    ${SEARCH_RESULTS}
        Wait Until Element Is Visible    ${SEARCHED_HEADER}    10s
        Wait Until Element Is Visible    ${SEARCH_RESULTS}    10s

        Close Browser Session