*** Settings ***
Documentation            Tests for Qentinel Pace Foundation training
Resource                     ../resources/keywords.robot
Resource                     ../resources/locators.robot

*** Test Cases ***
Homepage
    [Documentation]          First Exercise test Cases
    [Tags]                   training
    OpenBrowser              about:blank    ${BROWSER}
    GoTo                     ${URL}
    CloseAllBrowsers

Sign In
    [Documentation]          User Navigation to homepage and sign in
    [Tags]                   login
    OpenBrowser              about:blank    ${BROWSER}
    GoTo                     ${URL}
    ClickText                Sign in
    TypeText                 Email address    training.qentinel@gmail.com    Password
    TypeText                 Password         ${Password}
    ClickText                Sign in          Forgot your password?