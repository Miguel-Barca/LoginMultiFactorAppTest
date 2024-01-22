*** Settings ***
Library  SeleniumLibrary
Library    ../Resources/totp.py

*** Variables ***
${CREDENTIALS_URL}                signup
&{USER_VALID_CREDENTIALS}         Username=  Password=   AuthCode=   Secret= 
${DEMO_USER_XPATH}                xpath=/html/body/div[1]/h5
${PASSWORD_XPATH}                 xpath=/html/body/div[2]/h5
${AUTH_CODE_SECRET_XPATH}         xpath=//*[@id="secret"]


*** Keywords ***

Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${CREDENTIALS_URL}
    go to  ${SignInUrl}

Get Login Credentials (Secret)
    ${username}          Get Text     locator=${DEMO_USER_XPATH}
    ${password}          Get Text     locator=${PASSWORD_XPATH} 
    ${auth_code_secret}  Get Text     locator=${AUTH_CODE_SECRET_XPATH}

    ${USER_VALID_CREDENTIALS.Username}   Set Variable  ${username}
    ${USER_VALID_CREDENTIALS.Password}   Set Variable  ${password}
    ${USER_VALID_CREDENTIALS.Secret}     Set Variable  ${auth_code_secret}

Generate TOTP Token
    [Arguments]    ${secret}
    ${otp}=                              Get TOTP Token    ${secret}
    ${USER_VALID_CREDENTIALS.AuthCode}   Set Variable  ${otp}





    