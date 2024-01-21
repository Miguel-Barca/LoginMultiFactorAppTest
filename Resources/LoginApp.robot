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

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignIn.Verify Error Message  ${ExpectedErrorMessage}

Get Valid Credentials
    GetLoginCredentials.Navigate To
    Get Login Credentials.Get Login Credentials