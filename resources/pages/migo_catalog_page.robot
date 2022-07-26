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

    Log to console  Check Header Display...
    Verify Element Display  ${catalog_main_logo['${mobile}']}
    Verify Element Display  ${catalog_main_search['${mobile}']}
    Verify Element Display  ${catalog_main_promo['${mobile}']}

    Log to console Dash  Check Genre Display...
    Verify Element Display  ${catalog_main_genre_tab['${mobile}']}
    Verify Element Display  ${catalog_main_genre_comedy['${mobile}']}
    Verify Element Display  ${catalog_main_genre_drama['${mobile}']}
    Verify Element Display  ${catalog_main_genre_action['${mobile}']}
    Verify Element Display  ${catalog_main_genre_horror['${mobile}']}
    Verify Element Display  ${catalog_main_genre_romance['${mobile}']}
    Log to console  Swipe left
    Sleep  1s
    Scroll   1000  330  100  330  1000
    # Scroll   1000  330  50  330  1000
    Verify Element Display  ${catalog_main_genre_animation['${mobile}']}
    Verify Element Display  ${catalog_main_genre_kids['${mobile}']}
    Verify Element Display  ${catalog_main_genre_learning['${mobile}']}
    Verify Element Display  ${catalog_main_genre_music['${mobile}']}
    Verify Element Display  ${catalog_main_genre_sport['${mobile}']}
    Verify Element Not Display  ${catalog_main_genre_comedy['${mobile}']}
    Verify Element Not Display  ${catalog_main_genre_drama['${mobile}']}
    Verify Element Not Display  ${catalog_main_genre_action['${mobile}']}
    Verify Element Not Display  ${catalog_main_genre_horror['${mobile}']}
    Log to console  Swipe right
    Sleep  1s
    Scroll   100  330  1000  330  1000
    # Scroll   50  330  1000  330  1000
    Log to console Dash  Genre Pass


    Log to console Dash  Check Carousel
    Verify Element Display  ${catalog_main_carousel_image['${mobile}']}
    Verify Element Display  ${catalog_main_carousel_indicator['${mobile}']}
    Check Carousel
    Log to console Dash  Carousel Pass

    Log to console Dash  Check Channels
    Verify Element Display  ${catalog_main_channel_text['${mobile}']}
    Verify Element Display  ${catalog_main_channel_view['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_tab['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_1['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_2['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_3['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_4['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_5['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_6['${mobile}']}
    Check Channels 
    Log to console Dash  Channels Pass


    Log to console Dash  Check Row & My Saved Items
    Verify Element Display  ${catalog_main_rows_lionsgate_text['${mobile}']}
    Check Row And My Saved Items 
    Log to console Dash  Row & My Saved Items Pass 

    Log to console  Check Scrolling...
    Log to console  First Scroll: Scroll till Carousel not Display 
    Scroll To No Element And Check  ${catalog_main_carousel_image['${mobile}']}
    Log to console  Second Scroll: Scroll till Example Row not Display
    Scroll To No Element And Check  ${catalog_main_rows_lionsgate_text['${mobile}']}
    Verify Element Display  ${catalog_main_genre_tab['${mobile}']}
    Verify Element Display  ${catalog_main_search['${mobile}']}

       
Check Carousel

    FOR   ${i}   IN RANGE   3
        Wait Element And Click Element  ${catalog_main_carousel_image['${mobile}']}
        ${visible1}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
        ...   ${catalog_titlecard_name['${mobile}']}
        ${visible2}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
        ...   ${catalog_main_carousel_invite['${mobile}']}
        # if title card: say title card
        IF  ${visible1}
            Log to console  < This is Title Card >
        # else if invite friend: say invite friend
        ELSE IF  ${visible2}
            Log to console  < This is Invite Friend >
        # else: say row
        ELSE  
            Log to console  < This is Row >
        END
        Wait Element And Click Element  ${catalog_back['${mobile}']} 
        Wait Element And Click Element Option  ${catalog_back['${mobile}']} 
    END


Check Channels 
    
    Log to console  Check Lionsgate...
    Wait Element And Click Element  ${catalog_main_channel_channels_2['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_lionsgate['${mobile}']}  
    Wait Element And Click Element  ${catalog_back['${mobile}']}
    Log to console  Swipe left
    Sleep  1s
    Scroll   1000  1450  50  1450  1000
    Log to console  Check Noice...
    Wait Element And Click Element  ${catalog_main_channel_channels_2['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_noice['${mobile}']}  
    Wait Element And Click Element  ${catalog_back['${mobile}']} 

    Log to console  Check View All 
    Wait Element And Click Element  ${catalog_main_channel_view['${mobile}']}
    Wait Element And Click Element  ${catalog_main_channel_channels_2['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_lionsgate['${mobile}']}  
    Wait Element And Click Element  ${catalog_back['${mobile}']}
    Wait Element And Click Element  ${catalog_main_channel_channels_5['${mobile}']}
    Verify Element Display  ${catalog_main_channel_channels_noice['${mobile}']}  
    Wait Element And Click Element  ${catalog_back['${mobile}']}

    Wait Element And Click Element  ${catalog__back['${mobile}']} 

Check Row And My Saved Items 

    Verify Element Display  ${catalog_main_rows_1_view['${mobile}']} 
    Verify Element Display  ${catalog_main_rows_lionsgate_text['${mobile}']}
    Log to console  Check Row...
    Sleep  1s
    Wait Element And Click Element  ${catalog_main_rows_1_click['${mobile}']} 
    Log to console  Save the first not saved title card...
    Sleep  1s
    Wait Element And Click Element  ${catalog_main_rows_card_1['${mobile}']} 

    # Getting the First Not Saved Title Card from First Row
    ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
    FOR   ${i}   IN RANGE  100
        ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
        Exit For Loop If  '${save}' == 'Save'
        Log to console  Swipe left
        Scroll   1000  1600  100  1600  1000 
    END
    ${title} =  Wait Element And Get Text  ${catalog_titlecard_name['${mobile}']}
    Log to console  First Not Saved Title: ${title}

    # Save the First Unsaved Title Card in First Row 
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  Saved
    # Click View in Successfully Added
    Verify Element Display  ${catalog_titlecard_save_bar_text['${mobile}']}  
    Verify Element Display  ${catalog_titlecard_save_bar_btn_text['${mobile}']}  
    Wait Element And Click Element  ${catalog_titlecard_save_bar_btn_arrow['${mobile}']}

    Log to console  Check My Saved Items...
    # Checking if Title Card did Saved & Unsave it 
    Log to console  Check if Saved Successfully...
    Wait Element And Click Element  ${catalog_main_mysaveditems_card_1['${mobile}']}
    ${new_title1} =  Wait Element And Get Text  ${catalog_titlecard_name['${mobile}']}
    FOR   ${i}   IN RANGE  100
        Exit For Loop If  '${new_title1}' == '${title}'
        Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  Saved
        Log to console  Swipe left
        Scroll   1000  1600  100  1600  1000 
        ${new_title2} =  Wait Element And Get Text  ${catalog_titlecard_name['${mobile}']}
        Exit For Loop If  '${new_title1}' == '${new_title2}'
        ${new_title1} =  SET Variable  ${new_title2}
        END   
    Get Text And Compare  ${catalog_titlecard_name['${mobile}']}  ${title}
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  Saved
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  Save
    Wait Element And Click Element  ${catalog__back['${mobile}']}
    Wait Element And Click Element  ${catalog__back['${mobile}']}
    Wait Element And Click Element  ${catalog__back['${mobile}']}

    # Go back to First Row to Check if it did Unsave & Save it
    Log to console  Check if Unsaved Successfully...
    Wait Element And Click Element  ${catalog_main_rows_1_click['${mobile}']} 
    Wait Element And Click Element  ${catalog_main_rows_card_1['${mobile}']}

    FOR   ${i}   IN RANGE  100
        ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
        Exit For Loop If  '${save}' == 'Save'
        Log to console  Swipe left
        Scroll   1000  1600  100  1600  1000 
    END
    Get Text And Compare  ${catalog_titlecard_name['${mobile}']}  ${title}
    Log to Console  Save Again for Edit Use
    Wait Element And Click Element  ${catalog_titlecard_save['${mobile}']}
    Get Text And Compare  ${catalog_titlecard_save['${mobile}']}  Saved
    Wait Element And Click Element  ${catalog__back['${mobile}']}
    Wait Element And Click Element  ${catalog__back['${mobile}']}

    # Check Edit by Unsaving the First Title Card
    Log to console  Check Edit...

    Log to console  Get First Title
    Wait Element And Click Element  ${catalog_main_mysaveditems_view['${mobile}']}
    Wait Element And Click Element  ${catalog_main_mysaveditems_card_1['${mobile}']}
    ${title} =  Wait Element And Get Text  ${catalog_titlecard_name['${mobile}']}
    Wait Element And Click Element  ${catalog__back['${mobile}']}

    Log to console  Before Clicking Edit
    Verify Element Display  ${catalog_main_mysaveditems_edit_text['${mobile}']} 
    Verify Element Display  ${catalog_main_mysaveditems_edit_icon['${mobile}']} 
    # Verify Edit
    Wait Element And Click Element  ${catalog_main_mysaveditems_edit_icon['${mobile}']} 
    Log to console  After Clicking Edit
    Verify Element Display  ${catalog_main_mysaveditems_done_text['${mobile}']} 
    Verify Element Display  ${catalog_main_mysaveditems_done_icon['${mobile}']} 
    Verify Element Display  ${catalog_main_mysaveditems_remove['${mobile}']} 
    # Edit out the first title card
    Log to console  Edit Out the First Title Card 
    Wait Element And Click Element  ${catalog_main_mysaveditems_remove['${mobile}']} 
    Wait Element And Click Element  ${catalog_main_mysaveditems_done_icon['${mobile}']} 
    Wait Element And Click Element  ${catalog_main_mysaveditems_card_1['${mobile}']}
    Get Text And Not Equal  ${catalog_titlecard_name['${mobile}']}  ${title}
    Wait Element And Click Element  ${catalog__back['${mobile}']}
    Wait Element And Click Element  ${catalog__back['${mobile}']}    


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
    Scroll   550  1200  550  200  1000
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

    # Change to Unsave & No Comment
    Log to console  Change to Unsave & No Comment
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

    # Change to Unsave & No Comment Again 
    Log to console  Change to Unsave & No Comment Again 
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
    ${rating} =  Wait Element And Get Text  ${catalog_titlecard_rating['${mobile}']}
    ${save} =  Wait Element And Get Text  ${catalog_titlecard_save['${mobile}']}
    Log to console  Title: ${title}
    Log to console  Info: ${info}
    Log to console  Rating: ${rating}
    Log to console  Save: ${save}

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

    