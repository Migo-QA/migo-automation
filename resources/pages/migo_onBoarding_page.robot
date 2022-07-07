*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
Variables         ..${/}elements${/}migo_onBoarding_page.yaml


*** Keywords ***
Click Skip in onBoarding Page
    Log to console   Wait for onBoarding turtorial...
    Log to console   Check whether there is a tutorial 
    Sleep  5s
    Wait Element And Click Element Option   ${onBoarding_skip_text['${mobile}']}
