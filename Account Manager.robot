*** Settings ***
Documentation  This file contains the test cases for login, signup, logout and
...  similar where a user account and credentials are in play.

Library                SeleniumLibrary
Library                String
Resource               Common.robot
Suite Setup            Open Browser To Registration Page
Test Template          Registration With Invalid Data Should Fail
Suite teardown         Close all browsers


*** Test Cases ***  FIRST NAME    LAST NAME    EMAIL                        PASSWORD               EXPECTED ERROR MSG
Disposable Email    Juan          Garay        juan.garay@mailinator.com    cualquierpassword      Elige otra cuenta de e-mail              #This is not allowed for security reasons
Weak Password       Juan          Garay        juan.garay@gmail.com         aaaaaaaaaaaaaaaaa      No repitas más de 2 caracteres juntos    #This is for passwords policy
Missing First Name  ${EMPTY}      Garay        juan.garay@gmail.com         cualquierpassword      Completa este dato.
Missing Last Name   Juan          ${EMPTY}     juan.garay@gmail.com         cualquierpassword      Completa este dato.


*** keywords ***
Registration With Invalid Data Should Fail
    [Arguments]             ${firstName}  ${lastName}  ${email}  ${password}  ${error}
    Input Text              signupFirstName      ${firstName}
    Input Text              signupLastName       ${lastName}
    Input Text              signupEmail          ${email}
    Input Password          signupPassword       ${password}
    Submit Form             signup
    Page Should Contain     ${error}
