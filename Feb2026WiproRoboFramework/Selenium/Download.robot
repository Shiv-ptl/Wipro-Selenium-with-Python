*** Settings ***

Library     SeleniumLibrary

*** Variables ***
${url}      https://the-internet.herokuapp.com/download
*** Test Cases ***
Varify Download
        Open Browser        ${url}      firefox
        Maximize Browser Window
        Wait Until Element Is Visible       xpath://div[@class='example']
        Click Element       xpath://a[@xpath='3']

        ${files}=       List Files In Directory     C:/Users/Harsha Patil/Downloads
List Should Contain Value       ${files}        localfile.txt
        Close Browser