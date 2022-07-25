*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
Variables         ..${/}elements${/}migo_catalog_page.yaml
Variables         ..${/}elements${/}migo_auth_page.yaml

*** Variables ***
${content_preference}       //*[contains(@text, '$genres')]

*** Keywords ***

Click Catalog Main Tab

    Log to console  Swtich to Catalog Main Tab 
    Wait Element And Click Element  ${catalog_main_tab['${mobile}']}

Close In App Message

    [Documentation]
    ...
    ...    Close In App Message
    ...  
    Log to console    Close In app message...  
    Wait Element And Click Element Option  ${catalog_inAppMessageCloseButton['${mobile}']}   15
    Log to console    Pass!!!


Check Catalog Page 
    [Documentation]
    ...
    ...    Image and field on Catalog
    ...     
    Log to console  Check Catalog Page...

    Log to console  Check Header...
    Verify Element Display  ${catalog_main_logo['${mobile}']}
    Verify Element Display  ${catalog_main_search['${mobile}']}
    Verify Element Display  ${catalog_main_promo['${mobile}']}

    Log to console  Check Genre...
    Verify Element Display  ${catalog_main_genre_tab['${mobile}']}
    Verify Element Display  ${catalog_main_genre_comedy['${mobile}']}
    Verify Element Display  ${catalog_main_genre_drama['${mobile}']}
    Verify Element Display  ${catalog_main_genre_action['${mobile}']}
    Verify Element Display  ${catalog_main_genre_horror['${mobile}']}
    Verify Element Display  ${catalog_main_genre_romance['${mobile}']}
    Log to console  Swipe left
    Scroll   900  330  100  330  1000
    Verify Element Display  ${catalog_main_genre_animation['${mobile}']}
    Verify Element Display  ${catalog_main_genre_kids['${mobile}']}
    Verify Element Display  ${catalog_main_genre_learning['${mobile}']}
    Verify Element Display  ${catalog_main_genre_music['${mobile}']}
    Verify Element Display  ${catalog_main_genre_sport['${mobile}']}

    Log to console  Check Carousel...
    Verify Element Display  ${catalog_main_carousel_image['${mobile}']}
    Verify Element Display  ${catalog_main_carousel_indicator['${mobile}']}

    Log to console  Check Channels...
    Verify Element Display  ${catalog_main_channel_text['${mobile}']}
    Verify Element Display  ${catalog_main_channel_view['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_tab['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_1['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_2['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_3['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_4['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_5['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_6['${mobile}']}

    
    # Verify Element Display  ${catalog_migo_personal_recommendation['${mobile}']}
    # Verify Element Display  ${catalog_migo_personal_recommendation_all['${mobile}']}
    # Verify Element Display  ${catalog_migo_famous_movie['${mobile}']}
    # Verify Element Display  ${catalog_migo_famous_movie_all['${mobile}']}
    # Verify Element Display  ${catalog_migo_famous_series['${mobile}']}
    # Verify Element Display  ${catalog_migo_famous_series_all['${mobile}']}

Check Search Display
    [Documentation]
    ...
    ...     Check Search's Element Display
    ...     

    #Search
    Log to console  Click Search
    Wait Element And Click Element  ${catalog_main_search['${mobile}']}  

    Log to console  Check Search...

    Log to console  Check Serach Header...
    Verify Element Display  ${catalog_search_back['${mobile}']}
    Verify Element Display  ${catalog_search_input['${mobile}']}

    Log to console  Check Search by Genre...
    Verify Element Display  ${catalog_search_genre_text['${mobile}']}
    Verify Element Display  ${catalog_search_genre_comedy['${mobile}']}
    Verify Element Display  ${catalog_search_genre_drama['${mobile}']}
    Verify Element Display  ${catalog_search_genre_action['${mobile}']}
    Verify Element Display  ${catalog_search_genre_horror['${mobile}']}
    Verify Element Display  ${catalog_search_genre_romance['${mobile}']}
    Verify Element Display  ${catalog_search_genre_animation['${mobile}']}
    Verify Element Display  ${catalog_search_genre_kids['${mobile}']}
    Verify Element Display  ${catalog_search_genre_learning['${mobile}']}
    Verify Element Display  ${catalog_search_genre_music['${mobile}']}
    Verify Element Display  ${catalog_search_genre_sport['${mobile}']}

    Log to console  Check Trending on Migo...
    Verify Element Display  ${catalog_search_trending_text['${mobile}']}
    Verify Element Display  ${catalog_search_card_2['${mobile}']}
    Verify Element Display  ${catalog_search_card_3['${mobile}']}
    Log to console  Scroll Down 
    Scroll   550  1400  550  200  1000
    Verify Element Display  ${catalog_search_card_1['${mobile}']}
    Verify Element Display  ${catalog_search_card_2['${mobile}']}
    Verify Element Display  ${catalog_search_card_3['${mobile}']}
    Verify Element Display  ${catalog_search_card_4['${mobile}']}
    Verify Element Display  ${catalog_search_card_5['${mobile}']}
    Verify Element Display  ${catalog_search_card_6['${mobile}']}
    Verify Element Display  ${catalog_search_card_7['${mobile}']}
    Verify Element Display  ${catalog_search_card_8['${mobile}']}

Search
    [Arguments]   ${video_name}
    Log to console  Search ${video_name}
    Wait Element And Input    ${catalog_search_input['${mobile}']}    ${video_name}
    Verify Element Display  ${catalog_searched_video_1['${mobile}']}

Check Movie Title Card
    [Arguments]   ${video_name}
    Log to console  Click Movie Title Card: ${video_name}
    Wait Element And Click Element  ${catalog_searched_video_1['${mobile}']}

    Log to console  Checking Display...
    Verify Element Display  ${catalog_titlecard_name['${mobile}']}
    Verify Element Display  ${catalog_titlecard_video_info['${mobile}']}
    Verify Element Display  ${catalog_titlecard_synopsis['${mobile}']}
    Verify Element Display  ${catalog_titlecard_download_btn['${mobile}']}
    Verify Element Display  ${catalog_titlecard_download_icon['${mobile}']}
    Verify Element Display  ${catalog_titlecard_download_text['${mobile}']}
    Verify Element Display  ${catalog_titlecard_save['${mobile}']}
    Verify Element Display  ${catalog_titlecard_rating['${mobile}']}
    Log to console  Display Pass
 
    Log to console  Checking See More...
    Wait Element And Click Element  ${catalog_titlecard_seemore['${mobile}']}
    Verify Element Display  ${catalog_titlecard_subtitle['${mobile}']}
    Verify Element Display  ${catalog_titlecard_audio['${mobile}']}
    Verify Element Display  ${catalog_titlecard_advisory['${mobile}']}

    Wait Element And Click Element  ${catalog_titlecard_seeless['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_subtitle['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_audio['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_advisory['${mobile}']}
    Log to console  See More Pass

    Log to console Dash  Checking Save & Rating WITHOUT downloading...
    Check Save and Rating  ${video_name}
    Log to console Dash  Save & Rating WITHOUT downloading Pass

    Log to console Dash  Checking Save & Rating WITH downloading...
    Wait Element And Click Element  ${catalog_titlecard_download_btn['${mobile}']}
    Check Save and Rating  ${video_name}
    Log to console Dash  Save & Rating WITH downloading Pass

    # Download will be checked by download test
    Wait Element And Click Element  ${catalog_titlecard_back['${mobile}']} 

# Check 

Check Series Title Card
    [Arguments]   ${video_name}
    Log to console  Check Series Title Card: ${video_name}
    Wait Element And Click Element  ${catalog_searched_video_1['${mobile}']}
    Log to console  Checking Display...
    Verify Element Display  ${catalog_titlecard_name['${mobile}']}
    Verify Element Display  ${catalog_titlecard_video_info['${mobile}']}
    Verify Element Display  ${catalog_titlecard_synopsis['${mobile}']}
    Verify Element Display  ${catalog_titlecard_save['${mobile}']}
    Verify Element Display  ${catalog_titlecard_rating['${mobile}']}
    Log to console  Display Pass
 
    Log to console  Checking See More...
    Wait Element And Click Element  ${catalog_titlecard_seemore['${mobile}']}
    Verify Element Display  ${catalog_titlecard_subtitle['${mobile}']}
    Verify Element Display  ${catalog_titlecard_audio['${mobile}']}
    Verify Element Display  ${catalog_titlecard_advisory['${mobile}']}

    Wait Element And Click Element  ${catalog_titlecard_seeless['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_subtitle['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_audio['${mobile}']}
    Verify Element Not Display  ${catalog_titlecard_advisory['${mobile}']}
    Log to console  See More Pass

    Log to console  Checking Episode...
    Verify Element Display  ${catalog_titlecard_episode_list_1_tab['${mobile}']}
    Verify Element Display  ${catalog_titlecard_episode_list_1_title['${mobile}']}
    Verify Element Display  ${catalog_titlecard_episode_list_1_description['${mobile}']}
    Verify Element Display  ${catalog_titlecard_episode_list_1_download_btn['${mobile}']}
    Verify Element Display  ${catalog_titlecard_episode_list_1_download_icon['${mobile}']}
    Verify Element Display  ${catalog_titlecard_episode_list_1_download_text['${mobile}']}
    Log to console  Scroll Up
    Scroll   550  2000  550  1000  500
    Verify Element Display  ${catalog_titlecard_episode_list_12_tab['${mobile}']}
    log to console  Scroll Down 
    Scroll   550  1000  550  2000  500
    Verify Element Not Display  ${catalog_titlecard_episode_list_12_tab['${mobile}']}
    Log to console  Episode Pass

    Log to console Dash  Checking Save & Rating WITHOUT downloading...
    Check Save and Rating  ${video_name}
    Log to console Dash  Save & Rating WITHOUT downloading Pass

    Log to console Dash  Checking Save & Rating WITH downloading...
    Wait Element And Click Element  ${catalog_titlecard_episode_list_1_download_btn['${mobile}']}
    Check Save and Rating  ${video_name}
    Log to console Dash  Save & Rating WITH downloading Pass

    # Download will be checked by download test
    Wait Element And Click Element  ${catalog_titlecard_back['${mobile}']} 

Check Save and Rating 
    [Arguments]   ${video_name}

    Log to Console  Check Save & Rating for ${video_name}

    # Change to Saved & Liked
    Log to console  Change to Saved & Liked
      # Save
    ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
    ${new_save} =  Set Variable  Saved
    IF  '${save}' == 'Save'   
        Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
        Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}
    END
    ${new_save} =  Set Variable  Saved

      # Rating
    ${rating} =  Wait Element And Get Text  ${catalog_titlecard_rating['${mobile}']}
    ${new_rating} =  Set Variable  Liked
    IF  '${rating}' != 'Liked'   
        Wait Element And Click Element  ${catalog_titlecard_rating['${mobile}']}
        Wait Element And Click Element  ${catalog_titlecard_rating_like['${mobile}']}
        Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}
    END
    Back and Back

    # Change to NotSaved & No Comment
    Log to console  Change to NotSaved & No Comment
      # Save
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    ${new_save} =  Set Variable  Save
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}

      # Rating
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}
    Wait Element And Click Element  ${catalog_titlecard_rating['${mobile}']}
    ${new_rating} =  Set Variable  Like
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}

    Back and Back

    # Change to NotSaved & No Comment Again 
    Log to console  Change to Saved & No Comment Again 
      # Save
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}
      # Rating
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}
    Wait Element And Click Element  ${catalog_titlecard_rating['${mobile}']}
    Wait Element And Click Element  ${catalog_titlecard_rating_no['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}
    Back and Back

    # Last Compare
    Log to console  Last Compare 
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${new_save}
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${new_rating}

Back and Back
    Wait Element And Click Element  ${catalog_titlecard_back['${mobile}']}
    Sleep  1s
    Wait Element And Click Element  ${catalog_searched_video_1['${mobile}']}

Check Genre
    [Arguments]
    Log to console  Back to Main Catalog Page
    Wait Element And Click Element Option  ${catalog_search_back['${mobile}']}
    Wait Element And Click Element Option  ${catalog_main_tab['${mobile}']}
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${catalog_main_genre_sport['${mobile}']}
    IF  ${visible} == False
        Log to console  Scroll to Genre
        Scroll   900  330  100  330  1000
    END
    Log to console  Try Genre from Catalog
    Wait Element And Click Element  ${catalog_main_genre_sport['${mobile}']}
    Wait Element And Click Element  ${catalog_searched_video_1['${mobile}']}
    ${title} =  Wait Element And Get Text  ${catalog_titlecard_name['${mobile}']}
    ${info} =  Wait Element And Get Text  ${catalog_titlecard_video_info['${mobile}']}
    ${description} =  Wait Element And Get Text  ${catalog_titlecard_synopsis['${mobile}']}
    ${rating} =  Wait Element And Get Text  ${catalog_titlecard_rating['${mobile}']}
    ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
    Log to console  Title: ${title}
    Log to console  Info: ${info}
    Log to console  Rating: ${rating}
    Log to console  Save: ${save}
    # === NEW ===
    Wait Element And Click Element  ${catalog_titlecard_back['${mobile}']}
    Wait Element And Click Element  ${catalog_search_back['${mobile}']}
    Log to console  Try Genre from Search
    Wait Element And Click Element  ${catalog_main_search['${mobile}']}
    Wait Element And Click Element  ${catalog_search_genre_sport['${mobile}']}
    Wait Element And Click Element  ${catalog_searched_video_1['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_name['${mobile}']}  ${title}
    Log to console  Title: PASS
    Get Text And Compare  ${catalog_titlecard_video_info['${mobile}']}  ${info}
    Log to console  Info: PASS
    Get Text And Compare  ${catalog_titlecard_synopsis['${mobile}']}  ${description}
    Log to console  Description: PASS
    Get Text And Compare  ${catalog_titlecard_rating['${mobile}']}  ${rating}
    Log to console  Rating: PASS
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  ${save}
    Log to console  Save: PASS







# ====================== OLD ======================

Choose User Genres

    [Arguments]     ${genre1}   ${genre2}   ${genre3}   
    [Documentation]
    ...
    ...    Choose three of content prefernce
    ...     
    Log to console    Check Genre title....
    Verify Element Display  ${auth_genre_title['${mobile}']}
    Log to console    Pass!!!
    
    #Content Preference
    Log to console    Verify Geners element...
    Verify Element Display  ${auth_genres_Drama['${mobile}']}
    Verify Element Display  ${auth_genres_Petualangan['${mobile}']}
    Verify Element Display  ${auth_genres_Keluarga['${mobile}']}
    Verify Element Display  ${auth_genres_Aksi['${mobile}']}
    Verify Element Display  ${auth_genres_Horor['${mobile}']}
    Verify Element Display  ${auth_genres_Komedi['${mobile}']}
    Verify Element Display  ${auth_genres_Anime['${mobile}']}
    Verify Element Display  ${auth_genres_Reality['${mobile}']}
    Verify Element Display  ${auth_genres_Anakanak['${mobile}']}
    Verify Element Display  ${auth_genres_Romansa['${mobile}']}
    Verify Element Display  ${auth_genres_Edukasi['${mobile}']}
    Verify Element Display  ${auth_genres_KDrama['${mobile}']}
    Log to console    Pass!!!

    ${genre_1}=    Replace String 	${content_preference}    $genres	  ${genre1}
    ${genre_2}=    Replace String 	${content_preference}    $genres      ${genre2}
    ${genre_3}=    Replace String 	${content_preference}    $genres	  ${genre3}
       
    #Choose Genres
    Log to console    Choose three Geners...
    Wait Element And Click Element  ${genre_1}
    Wait Element And Click Element  ${genre_2}
    Wait Element And Click Element  ${genre_3}
    Log to console    Pass!!!
    Sleep  1s
    Log to console    Click Genre Button...
    Wait Element And Click Element  ${auth_genre_btn['${mobile}']}
    Log to console    Pass!!!

Click Coach Icon

    [Documentation]
    ...
    ...    Click OK on Coach
    ...   
    Log to console    Click OK on Coach...
    Verify Element Display  ${auth_coach_section['${mobile}']}
    Wait Element And Click Element  ${auth_coach_ok['${mobile}']}
    Log to console    Pass!!!

Add To Saved Items On Title Card   
    [Documentation]
    ...
    ...     Add to my Favorite video saved 
    ...     
    #Favorite save later
    Wait Element And Click Element  ${catalog_titlecard_savelater['${mobile}']}
    Verify Element Display  ${catalog_successful_save_bar['${mobile}']}


Remove To Saved Items On Title Card   
    [Documentation]
    ...
    ...     Remove to my Favorite video saved 
    ...     
    #Favorite save later
    Wait Element And Click Element  ${catalog_titlecard_savelater['${mobile}']}
    Press Keycode   4
    Verify Element Not Display  ${catalog_mysaved_item_section['${mobile}']}

Check My Saved Items 
    [Arguments]     ${saved_items}     
    [Documentation]
    ...
    ...     Check my Favorite video saved correctly
    ...     

    Click Catalog Main Tab
    Wait Element And Click Element  ${catalog_mysaved_item_section['${mobile}']}
    Sleep  1s
    Wait Element And Click Element  ${catalog_mysaved_item_video_asset['${mobile}']}
    Get Text And Compare    ${catalog_titlecard_name['${mobile}']}   ${saved_items} 


Search By Generes
    [Arguments]     ${genres}
    [Documentation]
    ...
    ...    Search Video with name and Check the Title card 
    ...     
    Log to console  Search the "${genres}"
    Wait Element And Click Element  ${catalog_searchbtn['${mobile}']}
    ${search_genres}=    Replace String 	${search_by_genres}    $genres	  ${genres}

    Wait Element And Click Element  ${search_genres}

    