*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}          chrome
${SEARCH_TERM}      robot framework
${SEARCH_RESULT}    selenium
${URL}              https://www.google.com


*** Test Cases ***
Search Google and Verify Results
    [Documentation]    Test case to search Google and verify results
    [Tags]    search
    Open Google
    Input Search Term
    Enter Google Search
    Verify Search Results
    Close Browser

Search Google and Check Results
    [Documentation]    Test case to search Google and verify results
    [Tags]    search
    Open Google
    Input Search Term
    Enter Google Search
    Verify Search Results
    Close Browser

Search Yahoo and Check Result
    [Documentation]    Test case to search Yahoo and verify results
    [Tags]    search
    Open Browser    https://www.yahoo.com    ${BROWSER}
    Input Text    name=p    ${SEARCH_TERM}
    Press Keys    name=p    ENTER
    Verify Search Results
    Close Browser


*** Keywords ***
Open Google
    Open Browser    https://www.google.com    ${BROWSER}

Input Search Term
    Input Text    name=q    ${SEARCH_TERM}

Enter Google Search
    Press Keys    name=q    ENTER

Verify Search Results
    Page Should Contain    ${SEARCH_RESULT}
