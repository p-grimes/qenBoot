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