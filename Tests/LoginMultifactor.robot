*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/LoginApp.robot
Library    ./totp.py
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/LoginMultifactor.robot

*** Variables ***

*** Test Cases ***
Login with invalid username should see correct error message at login
    [Documentation]  invalid username
    [Tags]    negative
    LoginApp.Navigate to Sign In Page
    LoginApp.Attempt Login  ${INVALID_USERNAME}
    LoginApp.Verify Login Page Error Message  ${INVALID_USERNAME.ExpectedErrorMessage}

Login with invalid password should show correct error message
    [Documentation]  invalid password
    [Tags]    negative
    LoginApp.Navigate to Sign In Page
    LoginApp.Attempt Login  ${INVALID_PASSWORD_USER}
    LoginApp.Verify Login Page Error Message  ${INVALID_PASSWORD_USER.ExpectedErrorMessage}

Login with blank email and password should show correct error message
    [Documentation]  blank Credentials
    [Tags]    negative
    LoginApp.Navigate to Sign In Page
    LoginApp.Attempt Login  ${BLANK_CREDENTIALS_USER}
    LoginApp.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}

Getting Valid Credentials - With TOTP Multifactor Login
    [Documentation]  Generate TOTP and proceed to Login with valid Credentials
    [Tags]    TOTP
    LoginApp.Get Valid Credentials
    LoginApp.Navigate to Sign In Page
    LoginApp.Attempt Login (with auth_code)  ${USER_VALID_CREDENTIALS}
    Sleep  5s