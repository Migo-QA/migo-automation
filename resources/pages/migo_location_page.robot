*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
Variables         ..${/}elements${/}migo_location_page.yaml
Variables         ..${/}elements${/}migo_auth_page.yaml

*** Keywords ***
Click Location Main Tab

    Log to console  Swtich to Location Main Tab 
    Wait Element And Click Element  ${location_main_tab['${mobile}']}
    #Verify Element Display  ${location_location_btn['${mobile}']}

Check the Onboard Location Tutorials

    [Documentation]
    ...
    ...    Check Location Onboard Tutorials 
    ...   
    Log to console    Check Onboard Tutorials...
    # check visible
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${location_onboard_tutorials_image['${mobile}']}
    IF  ${visible} == False
        Log to console  Check Onboard Tutorial: False
    ELSE
        Log to console  Check Onboard Tutorial: True
        Verify Element Display  ${location_onboard_tutorials_image['${mobile}']}
        Verify Element Display  ${location_onboard_tutorials_title['${mobile}']}
        Verify Element Display  ${location_onboard_tutorials_desc['${mobile}']}
        Log to console    Click Button: See Migo Wifi Location
        Wait Element And Click Element  ${location_onboard_tutorials_btn['${mobile}']}
        Log to console    Check Onboard Tutorials Pass
    END

Click Location Tuitorial Icon

    Log to Console  Click Location Tuitorial Icon
    AppiumLibrary.Click Element At Coordinates      70    180
    Log to console  Swtich to Location Tuitorial

Check Location Tutorials

    Click Location Tuitorial Icon

    Log to Console  Check Location Tutorials Page 1
    Verify Element Display  ${location_tutorials_title['${mobile}']}
    Verify Element Display   ${location_tutorials_close['${mobile}']}
    Verify Element Display  ${location_tutorials_step['${mobile}']}
    Verify Element Display  ${location_tutorials_image['${mobile}']}
    Get Text And Compare  ${location_tutorials_desc['${mobile}']}  Visit the closest Migo WiFi Network at Warung Migo around you.
    Wait Element And Click Element  ${location_tutorials_btn_next['${mobile}']}

    Log to console  Swipe left
    Scroll   900  1050  500  1050  1000
    Sleep  2s
    Log to Console  Check Location Tutorials Page 2
    Verify Element Display  ${location_tutorials_title['${mobile}']}
    Verify Element Display   ${location_tutorials_close['${mobile}']}
    Verify Element Display  ${location_tutorials_step['${mobile}']}
    Verify Element Display  ${location_tutorials_image['${mobile}']}
    Get Text And Compare  ${location_tutorials_desc['${mobile}']}  Open your phone WiFi Settings
    Wait Element And Click Element  ${location_tutorials_btn_next['${mobile}']}

    Log to console  Swipe left
    Scroll   900  1050  500  1050  1000
    Sleep  1s
    Log to Console  Check Location Tutorials Page 3
    Verify Element Display  ${location_tutorials_title['${mobile}']}
    Verify Element Display   ${location_tutorials_close['${mobile}']}
    Verify Element Display  ${location_tutorials_step['${mobile}']}
    Verify Element Display  ${location_tutorials_image['${mobile}']}
    Get Text And Compare  ${location_tutorials_desc['${mobile}']}  Must choose “Migo Hotspot Gratis”
    Wait Element And Click Element  ${location_tutorials_btn_next['${mobile}']}

    Log to console  Swipe left
    Scroll   900  1050  500  1050  1000
    Sleep  2s
    Log to Console  Check Location Tutorials Page 4
    Verify Element Display  ${location_tutorials_title['${mobile}']}
    Verify Element Display   ${location_tutorials_close['${mobile}']}
    Verify Element Display  ${location_tutorials_step['${mobile}']}
    Verify Element Display  ${location_tutorials_image['${mobile}']}
    Get Text And Compare  ${location_tutorials_desc['${mobile}']}  Movies in the download list will automatically download
    Get Text And Compare  ${location_tutorials_btn_next['${mobile}']}  See Migo WiFi Location
    Log to Console  Click button: See Migo WiFi Location
    Wait Element And Click Element  ${location_tutorials_btn_next['${mobile}']}

Click Location List Icon

    Log to Console  Click Location List Icon
    Sleep  4s
    AppiumLibrary.Click Element At Coordinates      950    180
    Log to console  Swtich to Location List Page


Check Finding Migo MDS

    Wait Element And Click Element  ${location_list_btn['${mobile}']}
    Wait Element And Click Element  ${location_map_btn['${mobile}']}
    Wait Element And Click Element  ${location_list_btn['${mobile}']}
    #Verify Element Display  ${location_location_icon['${mobile}']}

    Verify Element Display  ${location_location_icon['${mobile}']}
    Wait Element And Click Element  ${location_warung_migo['${mobile}']}

    Verify Element Display  ${location_warung_title['${mobile}']}
    Verify Element Display  ${location_warung_name['${mobile}']}
    Verify Element Display  ${location_warung_show_btn['${mobile}']}
    Wait Element And Click Element  ${location_back_btn['${mobile}']}
    Wait Element And Click Element  ${location_back_btn['${mobile}']}

Check Location List

    Click Location List Icon
    Log to Console  Check Location List Page...

    Sleep  2s
    Get Text And Compare    ${location_list_title['${mobile}']}    Warung Migo Areas
    Get Text And Compare    ${location_list_description['${mobile}']}    View a map of all our Warung Migo locations or find one below.
    Get Text And Contain  ${location_list_lastupdated['${mobile}']}  List last updated:
    Verify Element Display  ${location_list_map_icon['${mobile}']}
    Get Text And Compare    ${location_list_map_text['${mobile}']}    MAP
    Log to Console  Location List Page PASS

    Log to Console  Check List...
    Verify Element Display  ${location_list_wifi_icon['${mobile}']}
    # get text topic
    ${list_pasar} =  Wait Element And Get Text  ${location_list_jakarta_pasar['${mobile}']}
    Log to Console  Click List: Pasar Sawo Tanjung Lengkong
    Wait Element And Click Element  ${location_list_jakarta_pasar['${mobile}']}
    Get Text And Compare    ${location_list_sub_title['${mobile}']}    ${list_pasar}
    Log to Console  Check List PASS

    Verify Element Display  ${location_list_sub_mds_icon['${mobile}']}
    Verify Element Display  ${location_list_sub_description['${mobile}']}
    Verify Element Display  ${location_list_sub_mds_title['${mobile}']}
    Verify Element Display  ${location_list_sub_mds_subtitle['${mobile}']}
    Get Text And Compare    ${location_list_sub_mds_showinmap_text['${mobile}']}    Show in map
    Verify Element Display  ${location_list_sub_mds_showinmap_icon['${mobile}']}

    Log to Console  Check Sub List...
    Log to Console  Click Show in map
    Wait Element And Click Element  ${location_list_sub_mds_title['${mobile}']}
    Get Text And Compare    ${location_list_googlemap_url['${mobile}']}    google.com
    Log to Console  Close Google Map Link
    Wait Element And Click Element  ${location_list_googlemap_back['${mobile}']}
    User Press Back Key
    Log to Console  Sub List PASS
    
    # scroll page
    Log to console  Scroll Up
    Scroll   550  1500  550  1000  500
    Log to console  Scroll Up
    Scroll   550  1500  550  1000  500
        Log to console  Scroll Up
    Scroll   550  1500  550  1000  500

    Log to Console  Click MAP Icon
    Wait Element And Click Element  ${location_list_map_text['${mobile}']}
    