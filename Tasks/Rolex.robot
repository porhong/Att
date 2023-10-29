*** Settings ***
Documentation       Phone Charger

Library             SeleniumLibrary
Library             FakerLibrary


*** Variables ***
${LOGIN URL}    https://www.rolexoffice.asia/rolex-datejust-yellow-gold-diamonds?fbclid=IwAR1BuIXDKEf24Z7_ZPyX-ol4g2rRBUrf88QsNCfP687wiAdf628qoIF_l0U&utm_campaign=po8%20-%20rolex%20yellow%20gold%20-%201%20-%20cam
${BROWSER}      Chrome


*** Tasks ***
loop
    Set Selenium Speed    0.3sec
    Open Browser To Login Page
    # Set Window Size    390    844
    WHILE    True
        ${country}=    FakerLibrary.Country
        ${name}=    FakerLibrary.name
        ${phone}=    FakerLibrary.Phone Number
        ${address}=    FakerLibrary.Address
        Sleep    1sec
        check    (//p[@class='ladi-headline'][contains(text(),'ទិញ​ឥឡូវនេះ')])[1]
        Sleep    1sec
        Fill_in    (//input[@placeholder='ប្រទេស​របស់​អ្នក'])[1]    ${country}
        Fill_in    (//input[@placeholder='នាមត្រកូល​និង​ឈ្មោះ'])[1]    ${name}
        Fill_in    (//input[@placeholder='លេខទូរសព្ទ'])[1]    ${phone}
        Fill_in    (//input[@placeholder='អាស័យដ្ឋាន'])[1]    ${address}
        check    (//input[@value='ទិញ 1 តម្លៃ $69 + ដឹកជញ្ជូនឥតគិតថ្លៃ'])[1]
        check    (//input[@value='ទិញ 2 តំលៃ $99 + ដឹកជញ្ជូនឥតគិតថ្លៃ'])[1]
        check    (//input[@value='ទិញ 3 តំលៃ $129 + ដឹកជញ្ជូនឥតគិតថ្លៃ'])[1]
        submit    (//p[@class='ladi-headline'][contains(text(),'ទិញ​ឥឡូវនេះ')])[2]
        Wait Until Element Is Visible    (//h3[contains(text(),'Thank you')])[1]
        Sleep    1sec
        Go To    ${LOGIN URL}
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
