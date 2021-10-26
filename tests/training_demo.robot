*** Settings ***
Documentation            Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot
Suite Setup                  Start Suite
Suite Teardown               End Suite

*** Test Cases ***
Homepage
    [Documentation]          First Exercise test Cases
    [Tags]                   training
    GoTo                     ${URL}

Sign In
    [Documentation]          User Navigation to homepage and sign in
    [Tags]                   login
    
    GoTo                     ${URL}
    ClickText                Sign in
    TypeText                 Email address    training.qentinel@gmail.com    Password
    TypeSecret               Password         ${Password}
    ClickText                Sign in          Forgot your password?