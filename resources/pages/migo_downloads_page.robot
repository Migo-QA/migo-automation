*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_passes_page.robot
Variables         ..${/}elements${/}migo_downloads_page.yaml
Variables         ..${/}elements${/}migo_catalog_page.yaml
Variables         ..${/}elements${/}migo_location_page.yaml
Variables         ..${/}elements${/}migo_auth_page.yaml


*** Variables ***
${search_by_genres}       //*[contains(@text, '$genres')]


*** Keywords ***
Click Downloads Main Tab

    Log to console   Swtich to Downloads Main Tab
    Sleep  1s
    Wait Element And Click Element  ${downloads_main_tab['${mobile}']}


Check Download Page

    Log to console   Check Downloads Page (Connect MDS Network)...

    Sleep  5s
    Log to console   Check Download page title
    Verify Element Display  ${downloads_page_title['${mobile}']}
    Log to console   Download page title Pass

    #check Storage
    Log to console   Check Storage
    Verify Element Display  ${downloads_storage_icon['${mobile}']}
    Verify Element Display  ${downloads_storage_title['${mobile}']}
    Verify Element Display  ${downloads_storage_capacity['${mobile}']}
    Verify Element Display  ${downloads_storage_capacity_hint['${mobile}']}
    Log to console   Check Storage Pass

    #check Manage button
    Log to console   Check Manage button
    Verify Element Display  ${downloads_manage_icon['${mobile}']}
    Log to console   Manage button Pass

    # saving master
    Log to console   Check Saving Master
    Check Saving Master
    Log to console   Check Saving Master Pass

    # download empty and go to catalog
    Log to console   Check Download Empty
    Check Download Empty
    Log to console   Download Empty Pass


Check Saving Master

    Log to console   Check Saving Master elements
    Verify Element Display  ${downloads_saving_master_icon['${mobile}']}
    Verify Element Display  ${downloads_saving_master_title['${mobile}']}
    Verify Element Display  ${downloads_saving_master_description['${mobile}']}
    Verify Element Display  ${downloads_saving_master_value['${mobile}']}

    Log to console  Check Saving Master Page...
    Click Saving Master Tab

    Log to console  Check Saving Master Page 1
    Verify Element Display  ${downloads_saving_master_page1_title['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page1_movies['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page1_movies_count['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page1_episode['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page1_episode_count['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page1_graphic['${mobile}']}    

    Log to console  Swipe left
    Scroll   900  1050  100  1050  500
    Log to console  Check Saving Master Page 2
    Verify Element Display  ${downloads_saving_master_page2_title['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page2_gb_count['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page2_graphic['${mobile}']}  

    Log to console  Swipe left
    Scroll   900  1050  100  1050  500
    Log to console  Check Saving Master Page 3
    Verify Element Display  ${downloads_saving_master_page3_title['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page3_saving_count['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page3_hint['${mobile}']}
    Verify Element Display  ${downloads_saving_master_page3_graphic['${mobile}']}
    
    Click Close Saving Master


Click Saving Master Tab

    Log to console   Switch to Saving Master Tab
    Sleep  1s
    Wait Element And Click Element  ${downloads_saving_master_tab['${mobile}']}

Click Close Saving Master

    Sleep  5s
    Log to console  Click Close Saving Master
    Log to console  Switch to Download Tab 
    Wait Element And Click Element  ${downloads_saving_master_close['${mobile}']}

Check First Download Page

    #Download video to check the download successfully page
    Log to console  Check First Download Page
    Sleep  2s
    Verify Element Display  ${downloads_first_download_page_title['${mobile}']}
    Verify Element Display  ${downloads_first_download_page_subtitle['${mobile}']}
    Verify Element Display  ${downloads_first_download_page_img['${mobile}']}
    Wait Element And Click Element  ${downloads_first_download_page_btn['${mobile}']}
    Log to console  Click button: See My Download List
    Log to console  Switch to Downloads Tab

Click Browse Catalog

    Log to console  Click Browse Catalog
    Log to console  Switch to Catalog Tab
    Sleep  1s
    Wait Element And Click Element  ${downloads_empty_browse_catalog['${mobile}']}


Check Download Movie

    #Download video to check the download successfully page
    Log to console Dash  Check Download Movie
    Click Catalog Main Tab

    Sleep  5s
    Log to console  Search Movie
    Wait Element And Click Element  ${catalog_main_search['${mobile}']} 
    Search  Belajar Fauna
    Click The First Search Title Card
    Click Download Button on Movie Title Card
    Check Download Bar To Download Page

    # check after download
    Log to console  Download Movie File...
    Sleep  5s
    Log to console  Check Download Movie File
    Verify Element Display  ${downloads_file_movies_text['${mobile}']}
    Verify Element Display  ${downloads_file_movies_thumbnail['${mobile}']}
    Verify Element Display  ${downloads_file_movies_title['${mobile}']}
    Verify Element Display  ${downloads_file_movies_description['${mobile}']}
    Check Download Status
    Log to Console Dash  Download Movie Pass
    

Check Download Series

    #Download video to check the download successfully page
    Log to console Dash  Check Download Series

    # Search
    Log to console  Search Series
    Wait Element And Click Element  ${catalog_main_search['${mobile}']} 
    Search  Masha and The Bear
    Click The First Search Title Card
    
    # Download
    Log to console  Click Download to Watch
    Wait Element And Click Element   ${catalog_titlecard_episode_list_1_download_btn['${mobile}']}

    # Check First Download
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_first_download_page_bg['${mobile}']}
    IF  ${visible} == False
        Log to console  Check First Download Page: False
        #Go back to Download Page
        Sleep  2s
        Wait Element And Click Element   ${catalog_search_back['${mobile}']}
        Wait Element And Click Element   ${catalog_search_back['${mobile}']}
        Click Downloads Main Tab
    ELSE
        Log to console  Check First Download Page: True
        Check First Download Page
    END
    
    # check after download
    Sleep  5s
    Log to console  Check Download Series File
    Verify Element Display  ${downloads_file_tvshows_text['${mobile}']}
    Verify Element Display  ${downloads_file_tvshows_thumbnail['${mobile}']}
    Get Text And Compare    ${downloads_file_tvshows_title['${mobile}']}   Masha and The Bear
    Verify Element Display  ${downloads_file_tvshows_description['${mobile}']}
    Verify Element Display  ${downloads_file_tvshows_more['${mobile}']}
    Check Download Status
    Log to Console Dash  Download Series Pass

Check Download Status
    [Documentation]
    ...
    ...    Check Download Staus: Complete/Error
    ...
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_file_error['${mobile}']}
    IF  ${visible} == False
        Log to console  Check Download Status: Completed
    ELSE
        Log to console  Check Download Status: Error
    END
    

Check Download Empty
    [Documentation]
    ...
    ...    Check Download Empty and Go to Catalog
    ...
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_empty_text['${mobile}']}
    IF  ${visible} == False
        #not empty click tap catalog
        Log to console  Check Download Empty: False
        Click Catalog Main Tab
    ELSE
        #browse catalog
        Log to console  Check Download Empty: True
        Verify Element Display  ${downloads_empty_text['${mobile}']}
        Click Browse Catalog
    END


Click The First Search Title Card
    [Documentation]
    ...
    ...    First search result Title Card
    ...  
    Log to console  Click The First Search Title Card
    Wait Element And Click Element  ${catalog_search_first_video['${mobile}']}
    

Click Download Button on Movie Title Card
    [Documentation]
    ...
    ...    Download "Movie" Button
    ... 
    Log to console    Wait for download button text...
    ${button_status}=  Wait Element And Get Text  ${catalog_titlecard_download_text['${mobile}']}
    #catalog_titlecard_download_btn_text
    Log to console    Download button text is " ${button_status} "
    Run Keyword If   '${button_status}'=='Cancel Download'
    ...     Wait Element And Click Element   ${catalog_titlecard_download_btn['${mobile}']}
    ${button_status}=  Wait Element And Get Text  ${catalog_titlecard_download_text['${mobile}']}
    Run Keyword If   '${button_status}'=='Download to Watch'
    ...     Wait Element And Click Element   ${catalog_titlecard_download_btn['${mobile}']}   15s  
    Log to console    Click download button
    Sleep  2s

Click Download Button on Series Title Card
    [Documentation]
    ...
    ...    Download "Series" Button
    ... 
    Log to console    Wait for download button text...
    ${button_status}=  Wait Element And Get Text  ${catalog_titlecard_episode_list_1_download_text['${mobile}']}
    Log to console    Download button text is " ${button_status} "
    Run Keyword If   '${button_status}'=='Cancel Download'
    ...     Wait Element And Click Element   ${catalog_titlecard_episode_list_1_download_btn['${mobile}']}
    ${button_status}=  Wait Element And Get Text  ${catalog_titlecard_episode_list_1_download_text['${mobile}']}
    Run Keyword If   '${button_status}'=='Download to Watch'
    ...     Wait Element And Click Element   ${catalog_titlecard_episode_list_1_download_btn['${mobile}']}   15s  
    Log to console    Click download button
    Sleep  2s


Check Download Other episodes

    Log to console Dash  Check Download Other episodes
    Log to Console   Click Video Title
    Wait Element And Click Element  ${downloads_play_video_cover['${mobile}']}
    Log to Console   Click Download other episodes
    Wait Element And Click Element  ${downloads_play_download_other_episode['${mobile}']}
    Log to Console   Click Download episode 2
    Wait Element And Click Element  ${catalog_titlecard_episode_list_2_download_btn['${mobile}']}
    Check Download Bar To Download Page
    Log to Console Dash  Check Download Other episodes Pass
    

Check Manage Downloads

    Sleep  2s
    Wait Element And Click Element  ${downloads_manage_text['${mobile}']}
    Log to console  Switch to Manage Downloads Page

    Log to console  Check Manage Downloads Page elements...
    Log to console  Check title
    Verify Element Display  ${downloads_manage_title['${mobile}']}
    Verify Element Display  ${downloads_manage_internalstorage['${mobile}']}
    Verify Element Display  ${downloads_manage_icon['${mobile}']}
    Log to console  Check storage
    Verify Element Display  ${downloads_manage_total['${mobile}']}
    Verify Element Display  ${downloads_manage_space_capacity['${mobile}']}
    Verify Element Display  ${downloads_manage_space_remaining['${mobile}']}
    Verify Element Display  ${downloads_manage_progress_storage['${mobile}']}
    Verify Element Display  ${downloads_manage_migo['${mobile}']}
    Verify Element Display  ${downloads_manage_otherfiles['${mobile}']}
    Verify Element Display  ${downloads_manage_freespace['${mobile}']}


Check Delete Single Download Video

    Log to console  Check Delete Single Download Video...
    Log to console  Click delete button
    Wait Element And Click Element  ${downloads_manage_delete_btn['${mobile}']}
    
    Log to console  Check Confirm Delete Pop up
    Sleep  5s
    Verify Element Display  ${downloads_manage_delete_popup_title['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_description['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_delete['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_cancel['${mobile}']}
    
    Log to console  Click Cancel button
    Wait Element And Click Element  ${downloads_manage_delete_popup_cancel['${mobile}']}


Check Delete All Download Video

    Log to console  Check Delete All Download Video...
    Log to console  Click Delete All Download button
    Wait Element And Click Element  ${downloads_manage_delete_all_btn['${mobile}']}
    
    Log to console  Check Confirm Delete All Pop up
    Verify Element Display  ${downloads_manage_delete_popup_title['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_description['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_delete['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_cancel['${mobile}']}

    Log to console  Click Delete All
    Wait Element And Click Element  ${downloads_manage_delete_popup_delete['${mobile}']}

    Log to console  Check Empty Downloads
    Verify Element Display  ${downloads_empty['${mobile}']}
    Log to console  Check Empty Downloads: True

    Log to console  Switch to Downloads Page
    Wait Element And Click Element  ${downloads_manage_close['${mobile}']}

#unuse
Reading Download Tutorials

    Log to console  Reading Download Tutorials
    Wait Element And Click Element  ${downloads_tutorials_btn['${mobile}']}
    Wait Element And Click Element  ${downloads_tutorials_next_btn['${mobile}']}
    Wait Element And Click Element  ${downloads_tutorials_next_btn['${mobile}']}
    Wait Element And Click Element  ${downloads_tutorials_next_btn['${mobile}']}
    Wait Element And Click Element  ${downloads_tutorials_MDS_btn['${mobile}']}
    Verify Element Display  ${location_location_btn['${mobile}']}


Check Download Bar To Download Page

    Log to console  Check Download Snack Bar...
    Verify Element Display  ${catalog_successful_download_bar['${mobile}']}
    Log to console  Click View
    Wait Element And Click Element  ${catalog_bar_view['${mobile}']}
    Log to console  Switch to Downloads Tab
    Verify Element Display  ${downloads_page_title['${mobile}']}


Check Play Video old

    [Arguments]     ${video_name}   ${obb_info}  
    [Documentation]
    ...
    ...    Play and Check Video, surfaceview and video info
    ...     

    ${datetime}=    Get Current Date
    Wait Element And Click Element  ${downloads_play_video_icon['${mobile}']}    300
    Sleep  3s
    Log    Screenshot and save
    AppiumLibrary.Capture Page Screenshot   video_${datetime}_1.png
    Log    Screenshot saved!!
    Log to Console   Executing the  Optical Character Recognition(OCR) => OBB Checking...
    ${processed_img}=     Read Image    video_${datetime}_1.png
    ${content}=   Get Image Content   ${processed_img}    --psm 11   eng
    #Vision...

    # Should Contain     ${content}     DIPERSEMBAHKAN OLEH  
    # Should Contain     ${content}     Migo
    # Should Contain     ${content}     VISION 
    # Should Contain     ${content}     Ini, cara baru.  
    FOR    ${i}    IN    @{obb_info}
        Should Contain     ${content}     ${obb_info['${i}']} 
    END

    ${current_activity}=  Get Activity
    Should Be Equal    ${current_activity}    .ui.activity.nowplaying.ExoNowPlayingActivity
    Log to Console  Current Activity is : ${current_activity}
    Sleep  6s
    
    # Wait Element And Click Element  ${downloads_video_surfaceView['${mobile}']}    
    # AppiumLibrary.Click Element At Coordinates      1180    580

    # Get Text And Compare    ${downloads_video_title['${mobile}']}   ${video_name}
    # Verify Element Display  ${downloads_video_play_btn['${mobile}']}   
    # Verify Element Display  ${downloads_video_seekbar['${mobile}']}   
    # Wait Element And Click Element  ${downloads_video_forward_btn['${mobile}']} 
    # 
    AppiumLibrary.Capture Page Screenshot   video_${datetime}_2.png 
    # Wait Element And Click Element  ${downloads_play_back_btn['${mobile}']} 

Check Play Video 

    #[Arguments]     ${video_name}   ${obb_info}  
    [Documentation]
    ...
    ...    Play and Check Video, surfaceview and video info
    ...     
    Log to Console   Click Video Title
    Wait Element And Click Element  ${downloads_file_tvshows_title['${mobile}']}
    Log to Console   Check Video elements...
    Sleep  2s
    Verify Element Display  ${downloads_play_video_cover['${mobile}']}
    Verify Element Display  ${downloads_play_video_title['${mobile}']}
    Verify Element Display  ${downloads_play_video_episode_title['${mobile}']}
    Verify Element Display  ${downloads_play_video_icon['${mobile}']}
    Verify Element Display  ${downloads_play_video_episode['${mobile}']}
    Verify Element Display  ${downloads_play_video_info['${mobile}']}
    Verify Element Display  ${downloads_play_video_pb_watched['${mobile}']}
    Verify Element Display  ${downloads_play_download_other_episode['${mobile}']}

    Log to Console   Click Play
    Wait Element And Click Element  ${downloads_play_video_episode_title['${mobile}']}
    
    # check buy pass pop-up
    Log to Console   Check Buy Pass Dialog
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_buypass_dialog['${mobile}']}
    IF  ${visible} == False
        Log to console  Check Buy Pass Dialog: False
        Play Video 30s
    ELSE
        Log to console  Check Buy Pass Dialog: True
        Log to console  Check Buy Pass Dialog elements...
        Verify Element Display  ${downloads_buypass_dialog_title['${mobile}']}
        Verify Element Display  ${downloads_buypass_dialog_description['${mobile}']}
        Verify Element Display  ${downloads_buypass_dialog_btn_buy['${mobile}']}
        Verify Element Display  ${downloads_buypass_dialog_btn_cancel['${mobile}']}
        Log to console  Click Buy Pass
        Wait Element And Click Element  ${downloads_buypass_dialog_btn_buy['${mobile}']}
        Log to console  Switch to Passes tab
        # check buy pass tuitorial
        ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
        ...    ${downloads_buypass_dialog['${mobile}']}
        IF  ${visible} == False
            Log to console  Buy Pass Tutorial: False
            Redeem Promocode    migoqa2022
            Activate Pass   Last Day
        ELSE
            Log to console  Buy Pass Tutorial: True
            Log to console  Click Skip
            Wait Element And Click Element  ${passes_onboard_tutorials_skip['${mobile}']}
            Redeem Promocode    migoqa2022
            Activate Pass   Last Day
        END
        # go back to download and play
        Click Downloads Main Tab
        Log to Console   Click Play
        Wait Element And Click Element  ${downloads_play_video_episode_title['${mobile}']}
        Play Video 30s
    END

    #Go back to Download Page
    Sleep  2s
    Wait Element And Click Element   ${catalog_search_back['${mobile}']}    
    Log to Console   Switch to Downloads tab


Check Download Queue

    #[Arguments]     ${video_name}  
    [Documentation]
    ...
    ...    Check Download Queue for Restoration
    ...     
    #Wait Element And Click Element  ${downloads_main_tab['${mobile}']}
    Log to console  Check Download Queue...
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_queue_text['${mobile}']}
    IF  ${visible} == False
        Log to console  Check Download Queue: False
    ELSE
        Log to console  Check Download Queue: True
    END
    #Get Text And Compare    ${downloads_saved_queue['${mobile}']}   ${video_name}


Check Download Free Tag
    [Documentation]
        ...
        ...    Check Download Free Tag and Play it without pass
        ...   
    
    Log to console Dash  Check Download Free Tag
    Click Catalog Main Tab
    Sleep  5s

    # Search
    Log to console  Search Free Tag video
    Wait Element And Click Element  ${catalog_main_search['${mobile}']} 
    Search  Cara Melindungi
    Click The First Search Title Card
    Click Download Button on Movie Title Card
    Check Download Bar To Download Page

    # check after download
    Log to console  Download Free Tag File...
    Sleep  5s
    Log to console  Check Download Free Tag File
    Verify Element Display  ${downloads_file_freetag_thumbnail['${mobile}']}
    Verify Element Display  ${downloads_file_freetag_title['${mobile}']}
    Verify Element Display  ${downloads_file_freetag_description['${mobile}']}
    Check Download Status

    # play video
    Log to console  Play video Free Tag...
    Wait Element And Click Element  ${downloads_file_freetag_title['${mobile}']}
    Play Video 30s
    Log to Console Dash  Download Free Tag Pass

Play Video 30s
    # want to customize
    Log to Console   Playing video 30s...
    Sleep  30s
    Press Keycode  4
    
Enable VPN
    [Documentation]
        ...
        ...    Enable VPN, In case WFH
        ...   
    Log to Console   Enable VPN...
    Log to Console   Switch to Catalog Tab 
    Click Catalog Main Tab
    Log to Console   Click Migo debug
    Wait Element And Click Element  ${catalog_migo_debug['${mobile}']}
    Log to console  Scroll Up
    Scroll   550  1500  550  1000  500
    Log to console  Tab Enable VPN Mode
    Wait Element And Click Element  ${catalog_migo_debug_vpnmode['${mobile}']}
    Check Connect MDS WiFi
    Log to console  Switch to Catalog Tab
    Wait Element And Click Element  ${catalog_migo_debug_back['${mobile}']}
    Log to Console   Enable VPN: Pass

Check Download Page Public Network
    Log to console   Check Downloads Page (Connect Public Network)...
    Log to console   Check Wifi Alert message
    Verify Element Display  ${downloads_page_wifi_alert_title['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_btn_learnmore['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_btn_ok['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_icon_alert['${mobile}']}
    Log to console   Click button: Learn More
    Wait Element And Click Element  ${downloads_page_wifi_btn_learnmore['${mobile}']}
    Log to console   Checking onBoarding tutorial & "Skip"...
    Click Skip in onBoarding Page
    Log to console   Click button: OK
    Wait Element And Click Element  ${downloads_page_wifi_btn_ok['${mobile}']}
    # Check wifi alert message
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${downloads_page_wifi_alert_title['${mobile}']}
    IF  ${visible} == False
        Log to console  Check wifi alert message: False
    ELSE
        Log to console  Check wifi alert message: True
    END
    Log to console   Check Migo WiFi Connect tab
    Verify Element Display  ${downloads_page_wifi_connect_icon['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_connect_text['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_connect_button['${mobile}']}
    Verify Element Display  ${downloads_page_wifi_connect_more['${mobile}']}
    # Log to console   Click Connect
    # Wait Element And Click Element  ${downloads_page_wifi_connect_button['${mobile}']}
    # Check Connect MDS WiFi

Check Connect MDS WiFi
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${catalog_migo_debug_vpnmode_success['${mobile}']}
    IF  ${visible} == False
        Log to console  Check connect MDS WiFi: False
    ELSE
        Log to console  Check connect MDS WiFi: True
    END