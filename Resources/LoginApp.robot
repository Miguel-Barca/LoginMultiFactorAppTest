*** Settings ***
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/PO/GetLoginCredentials.robot


*** Keywords ***
Navigate to Sign In Page
    SignIn.Navigate To

Attempt Login 
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials  ${Credentials}
    SignIn.Click Submit
    Sleep  1s

Attempt Login (with auth_code)
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials(with auth_code)  ${Credentials}
    SignIn.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignIn.Verify Error Message  ${ExpectedErrorMessage}

Get Valid Credentials
    GetLoginCredentials.Navigate To
    Get Login Credentials.Get Login Credentials (Secret)
    GetLoginCredentials.Generate TOTP Token  ${USER_VALID_CREDENTIALS.Secret}

Test Multiple Scenarios
    [Arguments]   ${Credentials}
    Navigate to Sign In Page
    Attempt Login  ${Credentials} 
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}