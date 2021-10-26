*** Settings ***
Documentation             Reusable keywords and variables for Qentinel Pace Foundation training
Library                          QWeb
Library                          String

*** Variables ***
${BROWSER}                       chrome
${URL}                            http://automationpractice.com/
*** Keywords ***
Start Suite
    OpenBrowser                   about:blank    chrome
    SetConfig                     SearchMode     draw

End Suite
    CloseAllBrowsers

Appstate
       [Documentation]         Checks which actions should be taken prior to testing and does them
       [Arguments]                ${state}
       ${state}=                     Convert To Lowercase              ${state}
       Run Keyword If           '${state}'=='homepage'
       ...                                 Homepage
       Run Keyword If         '${state}'=='sign in'
       ...                              Sign in

Homepage
         GoTo                   ${URL}
         VerifyText            Automation Practice Website

Sign in
      Homepage
      ${signed_in}=          IsText                     Sign out
      Run Keyword If       ${signed_in}
      ...                            ClickText                 Sign out
      ClickText                 Sign in
      TypeText                 Email address         training.qentinel@gmail.com         Password
      TypeSecret             Password                ${PASSWORD}
      ClickText                 Sign in                     Forgot your password?
      VerifyText                Welcome to your account.