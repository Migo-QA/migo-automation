*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
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


Check Download
    Log to console   Check Downloads Page elements...

    Log to console   Check Download page title
    Verify Element Display  ${downloads_page_title['${mobile}']}

    #check Storage
    Log to console   Check Storage
    Verify Element Display  ${downloads_storage_icon['${mobile}']}
    Verify Element Display  ${downloads_storage_title['${mobile}']}
    Verify Element Display  ${downloads_storage_capacity['${mobile}']}
    Verify Element Display  ${downloads_storage_capacity_hint['${mobile}']}

    #check Manage button
    Log to console   Check Manage button
    Verify Element Display  ${downloads_manage_icon['${mobile}']}

    #check Download Empty
    Log to console   Check Download Empty
    Verify Element Display  ${downloads_empty_text['${mobile}']}
    Verify Element Display  ${downloads_empty_browse_catalog['${mobile}']}


Check Saving Master

    Log to console   Check Saving Master elements
    Verify Element Display  ${downloads_saving_master_icon['${mobile}']}
    Verify Element Display  ${downloads_saving_master_title['${mobile}']}
    Verify Element Display  ${downloads_saving_master_description['${mobile}']}
    Verify Element Display  ${downloads_saving_master_value['${mobile}']}

    Log to console  Check Saving Master Page...
    Click Saving Master Tab
    #not work
    Log to console  Swipe left
    Scroll   900  330  300  330  1000
    Click Close Saving Master
    Sleep  5s

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
    Log to console  Verify First Download Page
    Wait Element And Click Element  ${catalog_main_tab['${mobile}']}

    Click Geners Animation
    Click The Search By Geners Title Card 
    Click Download Button on Movie Title Card

    Verify Element Display  ${downloads_first_download_page_title['${mobile}']}
    Verify Element Display  ${downloads_first_download_page_subtitle['${mobile}']}
    Verify Element Display  ${downloads_first_download_page_img['${mobile}']}
    Wait Element And Click Element  ${downloads_first_download_page_btn['${mobile}']}


Click Browse Catalog

    Log to console  Click Browse Catalog
    Log to console  Switch to Catalog Tab
    Sleep  1s
    Wait Element And Click Element  ${downloads_empty_browse_catalog['${mobile}']}


Check Download Movie

    #Download video to check the download successfully page
    Log to console  Check Download Movie
    Click Browse Catalog

    Click Geners Animation
    Click The Search Movie Title Card
    Click Download Button on Movie Title Card
    # Log to console  Check Download Series
    # Click Download Button on Series Title Card

    # Verify Element Display  ${downloads_first_download_page_title['${mobile}']}
    # Verify Element Display  ${downloads_first_download_page_subtitle['${mobile}']}
    # Verify Element Display  ${downloads_first_download_page_img['${mobile}']}
    # Wait Element And Click Element  ${downloads_first_download_page_btn['${mobile}']}
    # Verify Element Display  ${downloads_page_title['${mobile}']}

Check Download Series

    #Download video to check the download successfully page
    Log to console  Check Download Series
    Click Catalog Main Tab

    Click Geners Animation
    Click The Search Series Title Card
    Click Download Button on Series Title Card
    #Go back to Download Page
    Check Download Bar To Download Page

Click Geners Animation
    [Documentation]
    ...
    ...    Select Generes: Animation
    ...
    Log to console  Click Search
    Wait Element And Click Element  ${catalog_main_search['${mobile}']}
    
    #click animation
    Log to console  Click Animation
    Wait Element And Click Element  ${catalog_search_genre_animation['${mobile}']}              


Click The Search Movie Title Card
    [Documentation]
    ...
    ...    Movie Title Card
    ...  
    Log to console  Click Search By Geners Movie Title Card
    Wait Element And Click Element  ${catalog_genres_video_movie['${mobile}']}


Click The Search Series Title Card
    [Documentation]
    ...
    ...    Series Title Card
    ...  
    Log to console  Click Search By Geners Series Title Card
    Wait Element And Click Element  ${catalog_genres_video_series['${mobile}']}
    

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
    Sleep  2s

# Check Download Snack Bar

#     Log to console  Check Download Snack Bar...
#     Verify Element Display  ${downloads_snack_bar_success['${mobile}']}
#     Verify Element Display  ${downloads_snack_bar_view['${mobile}']}
#     Verify Element Display  ${downloads_snack_bar_more['${mobile}']}
#     Log to console  Switch to Downloads Tab
#     Wait Element And Click Element  ${downloads_snack_bar_view['${mobile}']}


Check Manage Downloads

    Log to console  Switch to Manage Downloads Page
    Wait Element And Click Element  ${downloads_manage_text['${mobile}']}

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
    Verify Element Display  ${downloads_manage_delete_popup_title['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_description['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_delete['${mobile}']}
    Verify Element Display  ${downloads_manage_delete_popup_cancel['${mobile}']}
    
    Log to console  Click Cancel button
    Wait Element And Click Element  ${downloads_delete_popup_cancel['${mobile}']}


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
    Wait Element And Click Element  ${catalog_bar_view['${mobile}']}
    Log to console  Switch to Downloads Tab
    Verify Element Display  ${downloads_page_title['${mobile}']}
    # Verify Element Display  ${downloads_wifi_remind_alert['${mobile}']}
    # Verify Element Display  ${downloads_wifi_remind_title['${mobile}']}
    # Verify Element Display  ${downloads_wifi_remind_learnmore['${mobile}']}

Check Play Video 

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
    # Sleep  1s
    AppiumLibrary.Capture Page Screenshot   video_${datetime}_2.png 

    # Wait Element And Click Element  ${downloads_play_back_btn['${mobile}']} 

Check Download Queue

    [Arguments]     ${video_name}  
    [Documentation]
    ...
    ...    Check Download Queue for Restoration
    ...     

    Wait Element And Click Element  ${downloads_main_tab['${mobile}']}
    Get Text And Compare    ${downloads_saved_queue['${mobile}']}   ${video_name}
