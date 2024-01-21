
*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://seleniumbase.io/realworld
${LOGIN_URL} =  login

# Input Data - Negative Cases
&{INVALID_USERNAME}  Username=admin  Password=TestPassword!  ExpectedErrorMessage=Invalid Username!
&{INVALID_PASSWORD_USER}  Username=demo_user  Password=TestPassword!  ExpectedErrorMessage=The Password is Required!
&{BLANK_CREDENTIALS_USER}  Username=  Password=  ExpectedErrorMessage=The Username is Required!