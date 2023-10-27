*** Settings ***
Documentation       Phone Charger

Library             SeleniumLibrary
Library             FakerLibrary


*** Variables ***
${LOGIN URL}    https://www.allbestshopping.store/qualityphone.accessories?fbclid=IwAR2R-axzZ_YZb5jBR0qn1ZhcB2WeUd8-6pJsBBWaXx0NiNBV52Yxwd-xnCo
${BROWSER}      Chrome


*** Tasks ***
loop
    Set Selenium Speed    1sec
    Open Browser To Login Page
    Set Window Size    390    844
    WHILE    True
        ${name}=    FakerLibrary.name
        ${phone}=    FakerLibrary.Phone Number
        ${address}=    FakerLibrary.Address
        Fill_in
        ...    (//input[@placeholder='ឈ្មោះ​ពេញ​របស់​អ្នក'])[2]
        ...    (//input[@placeholder='លេខទូរស័ព្ទ (EX: 855...)'])[2]
        ...    (//input[@placeholder='អាស័យដ្ឋាន (ឧ៖ ណយ សុខ ភ្នំពេញ ៨៥៥ ខេមភូជៀ។)'])[2]
        ...    ${name}
        ...    ${phone}
        ...    ${address}
        check    (//input[contains(@name,'form_item72')])[3]
        check    (//input[contains(@name,'form_item72')])[4]
        submit    (//p[contains(@class,'ladi-headline ladi-transition')][contains(text(),'ទិញ​ឥឡូវនេះ')])[2]
        Verify    (//span[normalize-space()='Alert'])[1]    Alert
        Reload Page
        Sleep    3sec
    END

# *** Test Cases ***
# Valid Login
#    Open Browser To Login Page
#    Maximize Browser Window


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Fill_in
    [Arguments]    ${txt_name}    ${txt_phone}    ${txt_address}    ${name}    ${phone}    ${address}
    Sleep    1sec
    Input Text    ${txt_name}    ${name}
    Input Text    ${txt_phone}    ${phone}
    Input Text    ${txt_address}    ${address}
    # Click Element    ${check}
    Sleep    3sec
    # Click Element    ${btn_submit}

check
    [Arguments]    ${check}
    Click Element    ${check}

submit
    [Arguments]    ${btn_submit}
    Click Element    ${btn_submit}

Verify
    [Arguments]    ${result_value}    ${compare_value}
    Wait Until Element Contains    ${result_value}    ${compare_value}
