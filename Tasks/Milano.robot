*** Settings ***
Documentation       Phone Charger

Library             SeleniumLibrary
Library             FakerLibrary


*** Variables ***
${LOGIN URL}    https://www.ltmyperfume.click/chanel-paris?fbclid=IwAR1HVBa46R7NiQL2XNpuv93HNLIoCSqaFo8cZC5vlhWo2HBTBEEbWgMrpaI
${BROWSER}      Chrome


*** Tasks ***
loop
    Set Selenium Speed    1sec
    Open Browser To Login Page
    Set Window Size    390    844
    WHILE    True
        ${country}=    FakerLibrary.Country
        ${name}=    FakerLibrary.name
        ${phone}=    FakerLibrary.Phone Number
        ${address}=    FakerLibrary.Address
        Sleep    1sec
        check    (//p[@class='ladi-headline'][contains(text(),'ទិញ​ឥឡូវនេះ')])[1]
        Sleep    1sec

        Fill_in    (//input[@placeholder='នាមត្រកូល​និង​ឈ្មោះ'])[2]    ${name}
        Fill_in    (//input[@placeholder='លេខទូរសព្ទ'])[2]    ${phone}
        Fill_in    (//input[@placeholder='អាស័យដ្ឋាន'])[2]    ${address}
        check    (//input[@name='ရေမွှေးပုလင်းအရေအတွက်'])[4]
        check    (//input[@name='ရေမွှေးပုလင်းအရေအတွက်'])[5]
        check    (//input[@name='ရေမွှေးပုလင်းအရေအတွက်'])[6]
        check    (//select[@name='form_item67'])[2]
        check    (//option[@value='កូកូ'][contains(text(),'កូកូ')])[2]
        Wait Until Element Is Visible    (//span[normalize-space()='Alert'])[1]
        Sleep    1sec
        Reload Page
        Sleep    1sec
    END

# *** Test Cases ***
# Valid Login
#    Open Browser To Login Page
#    Maximize Browser Window


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Fill_in
    [Arguments]    ${txt_value}    ${value}
    Input Text    ${txt_value}    ${value}

check
    [Arguments]    ${check}
    Click Element    ${check}

submit
    [Arguments]    ${btn_submit}
    Click Element    ${btn_submit}

Verify
    [Arguments]    ${result_value}    ${compare_value}
    Wait Until Element Contains    ${result_value}    ${compare_value}
