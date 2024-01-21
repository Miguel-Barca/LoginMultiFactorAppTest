*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CREDENTIALS_URL}         signup
&{USER_VALID_CREDENTIALS}  Username=  Password=   AuthCode= 
${DEMO_USER_XPATH}         xpath=/html/body/div[1]/h5
${PASSWORD_XPATH}          xpath=/html/body/div[2]/h5
${AUTH_CODE_XPATH}         xpath=//*[@id="secret"]


*** Keywords ***

Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${CREDENTIALS_URL}
    go to  ${SignInUrl}


Get Login Credentials
    ${username}   Get Text     locator=${DEMO_USER_XPATH}
    ${password}   Get Text     locator=${PASSWORD_XPATH} 
    ${auth_code}  Get Text     locator=${AUTH_CODE_XPATH}
    Set Variable
    ${USER_VALID_CREDENTIALS.Username}   Set Variable  ${username}
    Log To Console  message=${USER_VALID_CREDENTIALS.Username} 
    