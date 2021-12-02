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

Appstate Test
    Appstate                 sIgN in
    Appstate                 sIgN in
    Appstate                 hoMePagE
    Appstate                 sIgN in

Appstate Final Test
    Appstate                 final


New Lead
    [Documentation]
    [Tags]
    SetConfig                SearchMode       draw  
    Appstate
    ...
    ...
    ...


Delete Row From Lead
    [Documentation]
    [Tags]
    SetConfig                SearchMode       draw  
    Appstate
    ...
    ...
    ...
