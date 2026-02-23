*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords.robot

*** Variables ***
${PRODUCTS_BTN}        xpath=//a[contains(text(),'Products')]
${ALL_PRODUCTS_HEADER}      xpath=//h2[contains(text(),'All Products')]

${PRODUCT_LIST}        xpath=//div[@class='features_items']
${FIRST_VIEW_PRODUCT}       xpath=(//a[contains(text(),'View Product')])[1]

${PRODUCT_NAME}        xpath=//div[@class='product-information']/h2
${PRODUCT_CATEGORY}     xpath=//p[contains(text(),'Category')]
${PRODUCT_PRICE}       xpath=//span[contains(text(),'Rs')]
${PRODUCT_AVAILABILITY}     xpath=//b[contains(text(),'Availability')]
${PRODUCT_CONDITION}        xpath=//b[contains(text(),'Condition')]
${PRODUCT_BRAND}        xpath=//b[contains(text(),'Brand')]


*** Keywords ***
Switch To Main Window
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[0]

Close Ads If Present
    Run Keyword And Ignore Error    Execute Javascript    document.querySelectorAll('iframe').forEach(function(e){e.remove();});
    Run Keyword And Ignore Error    Execute Javascript    document.querySelectorAll("[id^='aswift']").forEach(function(e){e.remove();});


*** Test Cases ***
Verify All Products And Product Detail
    Open Browser To Website
    Switch To Main Window
    Verify Home Page Visible

    Click Element    ${PRODUCTS_BTN}
    Close Ads If Present

    Wait Until Element Is Visible    ${PRODUCT_LIST}    15s

    Close Ads If Present
    Scroll Element Into View    ${FIRST_VIEW_PRODUCT}

    Execute Javascript    arguments[0].click();    ${FIRST_VIEW_PRODUCT}


    Wait Until Element Is Visible    ${PRODUCT_NAME}    10s
    Element Should Be Visible    ${PRODUCT_CATEGORY}
    Element Should Be Visible    ${PRODUCT_PRICE}
    Element Should Be Visible    ${PRODUCT_AVAILABILITY}
    Element Should Be Visible    ${PRODUCT_CONDITION}
    Element Should Be Visible    ${PRODUCT_BRAND}

    Close Browser Session
#Verify All Products And Product Detail
#    Open Browser To Website
#    #Switch To Main Window
#    Verify Home Page Visible
#
#    Click Element    ${PRODUCTS_BTN}
#    Sleep    3s
#    Close Ads If Present
#    Sleep    2s
##    Select Frame        xpath://iframe[@id='aswift_1']
##    Sleep    2s
##    Click Element       xpath://input[@id='dismiss-button']
##
##    Unselect Frame
#    Sleep    4s
#
#    #Scroll Element Into View    xpath://h2[contains(text(),'All Products')]
#
#    #Wait Until Element Is Visible    ${ALL_PRODUCTS_HEADER}    10s
#
#    Wait Until Element Is Visible    ${PRODUCT_LIST}    10s
#    Close Ads If Present
#
#    Sleep    5s
#    Scroll Element Into View    ${FIRST_VIEW_PRODUCT}
#
#    Click Element    ${FIRST_VIEW_PRODUCT}
#
#    Wait Until Element Is Visible    ${PRODUCT_NAME}    10s
#    Element Should Be Visible    ${PRODUCT_CATEGORY}
#    Element Should Be Visible    ${PRODUCT_PRICE}
#    Element Should Be Visible    ${PRODUCT_AVAILABILITY}
#    Element Should Be Visible    ${PRODUCT_CONDITION}
#    Element Should Be Visible    ${PRODUCT_BRAND}
#
#    Close Browser Session