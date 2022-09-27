
*** Settings ***
Documentation  Test for checking Login Page

Library  Selenium2Library


*** Variables ***
${url}  https://www.contorion.de/

${Browser}  chrome
*** Test Cases ***
Contorion Credential Login
         Open Browser  ${url}  ${Browser}
         Login Page


*** Keywords ***

Login Page

       Maximize Browser Window
       exception
       Click Element    xpath=//*[@id="page-home-index"]//header/div[3]/div/div[4]/a
       Input Text    xpath=//*[@id="login_email"]    mayaraj01@gmail.com
       Input Password     xpath=//*[@id="login_password"]   Demo12345
       Click Button    xpath=//button[@type="submit"]
       Element Should Contain    xpath=//*[@id="content"]//div[2]/div[1]/div[2]   Du bist nun bei Contorion angemeldet.
       Mouse Over    xpath=//i[@class="icon--account header__nav-item-icon"]
       Element Should Contain    xpath=//h3[@class="txt--truncate"]   Hallo, Maya
       Click Element    name=q
       Input Text    name=q   Hammer
       Click Button    id=search-button
       Close All Browsers

exception
     ${count}=  Get Element Count  id=popin_tc_privacy_button
     Run Keyword If  ${count} > 0  Click Button    id=popin_tc_privacy_button
