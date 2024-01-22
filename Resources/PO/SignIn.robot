*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_USERNAME_XPATH} =       xpath=//input[@id='username']
${SIGN_IN_PASSWORD_XPATH} =       xpath=//input[@id='password']
${SIGN_IN_AUTHCODE_XPATH} =       xpath=//input[@id='totpcode']
${LOGIN_SUBMIT_BUTTON} =    log-in

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}

Enter Credentials
    [Arguments]  ${Credentials}
    Input Text  ${SIGN_IN_USERNAME_XPATH}  ${Credentials.Username}
    Input Text  ${SIGN_IN_PASSWORD_XPATH}  ${Credentials.Password}

Enter Credentials(with auth_code)
    [Arguments]  ${Credentials}
    Input Text  ${SIGN_IN_USERNAME_XPATH}  ${Credentials.Username}
    Input Text  ${SIGN_IN_PASSWORD_XPATH}  ${Credentials.Password}
    Input Text  ${SIGN_IN_AUTHCODE_XPATH}  ${Credentials.AuthCode}

Click Submit
    Click Element  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Log To Console  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

