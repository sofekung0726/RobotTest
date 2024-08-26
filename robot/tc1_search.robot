*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}              chrome
${SEARCH_TERM}          ai
${SEARCH_RESULT1}       หลักสูตร 2 รายการ
${SEARCH_RESULT2}       หลักสูตร 1 รายการ
${SEARCH_RESULT3}       หลักสูตร 5 รายการ
${SEARCH_RESULT4}       หลักสูตร 1 รายการ
${SEARCH_RESULT5}       หลักสูตร 2 รายการ
${URL}                  https://sc.npru.ac.th/sc_shortcourses/
${screen_shot_dir}      ./screenshots/


*** Test Cases ***
Search by Keyword TC1001
    [Documentation]    Test case to search keyword and verify results
    [Tags]    search
    Open Website
    Click Link Menu
    Input Search Term
    Enter to Search
    Verify Search Results1
    Close Browser

Search by Keyword TC1002
    [Documentation]    Test case to search by select month and verify results
    [Tags]    search
    Open Website
    Click Link Menu
    Select Option Menu January
    Verify Search Results2
    Close Browser

Search by Keyword TC1003
    [Documentation]    Test case to search by check categoty and verify results
    [Tags]    search
    Open Website
    Click Link Menu
    Check Categoty
    Verify Search Results3
    Close Browser

Search by Keyword TC1004
    [Documentation]    Test case to search by keyword and select month and verify results
    [Tags]    search
    Open Website
    Click Link Menu
    Input Search Term
    Enter to Search
    Select Option Menu March
    Verify Search Results4
    Close Browser

Search by Keyword TC1005
    [Documentation]    Test case to search by keyword and check categoty and verify results
    [Tags]    search
    Open Website
    Click Link Menu
    Check Categoty
    Input Search Term
    Enter to Search
    Verify Search Results5
    Close Browser


*** Keywords ***
Open WebSite
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Click Link Menu
    Click Link    xpath=//*[@id="navbarMain"]/ul/li[2]/a

Input Search Term
    Input Text    xpath=/html/body/section/div/div/div[1]/form/div[1]/div/input    ${SEARCH_TERM}
    Sleep    5 seconds

Enter to Search
    Wait Until Element Is Visible    xpath=/html/body/section/div/div/div[1]/form/div[1]/div/input
    Press Keys    xpath=/html/body/section/div/div/div[1]/form/div[1]/div/input    ENTER
    Sleep    5 seconds

Verify Search Results1
    Element Text Should Be    xpath=/html/body/section/div/div/div[1]/form/div[3]/small    ${SEARCH_RESULT1}

Verify Search Results2
    Element Text Should Be    xpath=/html/body/section/div/div/div[1]/form/div[3]/small    ${SEARCH_RESULT2}

Verify Search Results3
    Element Text Should Be    xpath=/html/body/section/div/div/div[1]/form/div[3]/small    ${SEARCH_RESULT3}

Verify Search Results4
    Element Text Should Be    xpath=/html/body/section/div/div/div[1]/form/div[3]/small    ${SEARCH_RESULT4}

Verify Search Results5
    Element Text Should Be    xpath=/html/body/section/div/div/div[1]/form/div[3]/small    ${SEARCH_RESULT5}

Select Option Menu January
    Select From List By Index    name=m    1
    Sleep    5 seconds

Select Option Menu March
    Select From List By Index    name=m    3
    Sleep    5 seconds

Check Categoty
    Select Checkbox    xpath=//*[@id="categoryItem1"]
    Sleep    5 seconds
