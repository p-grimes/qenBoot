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
       Run Keyword If         '${state}'=='final'
       ...                              Final

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

Final                        
    Homepage
    ${signed_in}=          IsText                     Sign out
      Run Keyword If       ${signed_in}
      ...                            ClickText                 Sign out
    ClickText                 Sign in
    TypeText                  Email address                    FakeBanana123@gmail.com
    ClickText                 Create an account
    ClickText                 1
    TypeText    First name    Paul
    TypeText    Last name    Grimes
    TypeSecret    Password    SuperSecret
    DropDown    -    10                        anchor=days
    DropDown    -    October                        anchor=months
    DropDown    -    1994                        anchor=years
    ClickCheckbox    Sign up for our newsletter!    on
    ClickCheckbox    Receive special offers from our partners!    on
    TypeText    Company    Copado
    TypeText    Address    110 w 6th st SE   
    TypeText    City    Portland    
    DropDown    -    Maine    anchor=State
    TypeText    Zip/Postal Code    97202
    TypeText    Home phone    5419712898
    TypeText    Mobile phone    5419712898
    Homepage
