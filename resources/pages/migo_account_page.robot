*** Settings ***
Resource          ..${/}variables.resource
Resource          ..${/}libraries.resource
Resource          ..${/}utility${/}utility_keywords.robot
Variables         ..${/}elements${/}migo_account_page.yaml
Variables         ..${/}elements${/}migo_auth_page.yaml

*** Keywords ***
Click Account Main Tab

    Sleep  5s
    Log to console  Swtich to Account Main Tab 
    Wait Element And Click Element  ${account_main_tab['${mobile}']}


Click My Rewards Tab

    Log to console  Swtich to My Rewards Tab
    Wait Element And Click Element  ${account_rewards_tab['${mobile}']} 
    
Click Linked Phone Number Tab
    
    Log to console  Swtich to Linked Phone Number Tab
    sleep  1s
    Wait Element And Click Element  ${account_linked_phone_number_tab['${mobile}']} 

Click Parental Control Tab
    
    Log to console  Swtich to Parental Control Tab
    sleep  1s
    Wait Element And Click Element  ${account_parental['${mobile}']} 

Click Payment Methods Tab
    
    Log to console  Swtich to Payment Methods Tab
    sleep  1s
    Wait Element And Click Element  ${account_payment['${mobile}']} 

Click Transaction History Tab
    
    Log to console  Swtich to Transaction History Tab
    sleep  1s
    Wait Element And Click Element  ${account_transaction['${mobile}']} 

Click Customer Support Icon

    Log to console  Swtich to Customer Support
    sleep  1s
    AppiumLibrary.Click Element At Coordinates      1000    2030

Close Migo Reward Introduction Notification

    Log to console   Close Reward Introduction Notification...
    Sleep  2s
    Wait Element And Click Element Option  ${account_rewards_notification_close_dialog['${mobile}']}  15

Click Milestone View Pass Dialog

    Log to console   Milestone dialog
    Sleep  2s
    Log to console   Click View Free Pass Button
    Wait Element And Click Element  ${catalog_milestone_dialog_ViewPass['${mobile}']}
    Sleep  2s
    Log to console   Check if it is in Migo Point Page...


Check Account Main Tab After Login

    Log to console  Account Items Checking...

    # Profile
    Log to console Dash  Check Profile
    Check Profile
    Log to Console Dash  Profile Pass

    # My Rewards
    Log to console Dash  Check My Migo Reward  
    Check My Migo Reward
    Log to Console Dash  My Migo Reward Pass 

    #===Verify title of item====
    Log to console  Check items title...
    Log to console  Check "Account" title
    Verify Element Display  ${account_title_account['${mobile}']}
    Sleep  1s
    Log to console  Check "Payment" title
    Verify Element Display  ${account_title_payment['${mobile}']}
    Sleep  1s
    Log to console  Check "Help Center" title
    Verify Element Display  ${account_help_center['${mobile}']}
    Sleep  1s
    Log to console  ======= Account title Pass ==========
    #===Verify items===
    Log to console  Check Account page item Element...

        #=== Referral ===
    Log to console  Check Referral Icon
    Verify Element Display  ${account_referral_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Referral Text
    Verify Element Display  ${account_referral_text['${mobile}']}
    Sleep  1s

    Log to console  Check Referral More icon
    Verify Element Display  ${account_referral_more['${mobile}']}
    Sleep  1s


        #=== Linked Phone Number ===
    Log to console  Check Linked Phone Number Icon
    Verify Element Display  ${account_linked_phone_number_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Linked Phone Number Text
    Verify Element Display  ${account_linked_phone_number['${mobile}']}
    Sleep  1s

    Log to console  Check Linked Phone Number More icon
    Verify Element Display  ${account_tutorial_more['${mobile}']}
    Sleep  1s

        #===Parental Control===
    Log to console  Check Parental Control Icon
    Verify Element Display  ${account_parental_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Parental Control Text
    Verify Element Display  ${account_parental['${mobile}']}
    Sleep  1s

    Log to console  Check Parental Control More icon
    Verify Element Display  ${account_parental_more['${mobile}']}
    Sleep  1s

        #===Payment Methods===
    Log to console  Check Payment Methods Icon
    Verify Element Display  ${account_payment_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Payment Methods Text
    Verify Element Display  ${account_payment['${mobile}']}
    Sleep  1s

    Log to console  Check Payment Methods More icon
    Verify Element Display  ${account_payment_more['${mobile}']}
    Sleep  1s

        #===Transaction History===
    Log to console  Check Transaction History Icon
    Verify Element Display  ${account_transaction_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Transaction History Text
    Verify Element Display  ${account_transaction['${mobile}']}
    Sleep  1s

    Log to console  Check Transaction History More icon
    Verify Element Display  ${account_transaction_more['${mobile}']}
    Sleep  1s

        #===Contact Us===
    Log to console  Check Contact Us Icon
    Verify Element Display  ${account_contactUs_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Contact Us Text
    Verify Element Display  ${account_contactUs_text['${mobile}']}
    Sleep  1s

    Log to console  Check Contact Us More icon
    Verify Element Display  ${account_contactUs_more['${mobile}']}
    Sleep  1s

        #===Migo Tutorial===
    Log to console  Check Migo Tutorial Icon
    Verify Element Display  ${account_tutorial_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Migo Tutorial Text
    Verify Element Display  ${account_tutorial['${mobile}']}
    Sleep  1s

    Log to console  Check Migo Tutorial More icon
    Verify Element Display  ${account_tutorial_more['${mobile}']}
    Sleep  1s

        #===Scroll up to the bottom===
        #===Share Feedback===
    Log to console  Check Share Feedback Icon
    Scroll To Element And Check  ${account_feedback_icon['${mobile}']}
    Sleep  1s

    Log to console  Check Share Feedback Text
    Scroll To Element And Check  ${account_feedback['${mobile}']}
    Sleep  1s

    Log to console  Check Share Feedback More icon
    Scroll To Element And Check  ${account_feedback_more['${mobile}']}
    Sleep  1s
    Log to console  ======= Account Page element check Pass ==========
        
    Log to console  Scroll up to bottom...
    Log to console  Check Logout Text...
    Scroll To Element And Check  ${account_logout['${mobile}']}
    Sleep  1s
    Log to console  Check version number
    Scroll To Element And Check  ${account_version['${mobile}']}

    Log to console  ======= Version Number Check Pass ==========

    #=== Verify Main Tab ===
    Log to console  Check Catalog Tab...
    Verify Element Display  ${catalog_main_tab['${mobile}']}
    Sleep  1s
    Log to console  Check Download Tab...
    Verify Element Display  ${downloads_main_tab['${mobile}']}
    Sleep  1s
    Log to console  Check Location Tab...
    Verify Element Display  ${location_main_tab['${mobile}']}
    Sleep  1s
    Log to console  Check Passes Tab...
    Verify Element Display  ${passes_main_tab['${mobile}']}
    Sleep  1s
    Log to console  Check Account Tab...
    Verify Element Display  ${account_main_tab['${mobile}']}
    Sleep  1s
    Log to console  ======= Main Tab Check Pass ==========



Login Migo Account
    [Arguments]     ${contry_code}   ${phone_number} 
    [Documentation]
    ...
    ...    Login With Country Code and Phone Number
    ...  
    Log to console    Click Account Tab...
    Click Account Main Tab
    Log to console    Pass!!!
    Sleep   2s

    Log to console    Click register and login tab...
    Wait Element And Click Element   ${account_register_login_tab['${mobile}']}
    Log to console    Pass!!!
    Sleep   2s

    Log to console    Verify element on register and login page...   
    Verify Element Display  ${auth_register_title['${mobile}']}
    Verify Element Display  ${auth_register_countrycode['${mobile}']}
    Verify Element Display  ${auth_register_helphint['${mobile}']}
    Log to console    Pass!!!

    Input Phone Number      ${phone_number} 


Input Phone Number
    [Arguments]     ${phone_number}    
    [Documentation]
    ...
    ...    Account/Phone Number Identity
    ...  
    Log to console    Input Phone Number...
    @{number}    Split String To Characters    ${phone_number}
    FOR    ${i}    IN    @{number}
        Press Mobile Keypad    ${i}
    END
    Log to console    Finished!!!
    Log to console    Click "I agree" button...
    Wait Element And Click Element   ${auth_register_agree_btn['${mobile}']}
    Log to console    Pass!!!

Enter OTP code 

    Log to console    Verify OTP page elements...
    Verify Element Display  ${auth_otp_title['${mobile}']}
    Verify Element Display  ${auth_otp_desc['${mobile}']}
    Verify Element Display  ${auth_register_resend_btn['${mobile}']}
    Log to console    Pass!!!
    Log to console    Check resend hint...
    Wait Element And Click Element   ${auth_register_resend_hint['${mobile}']}
    Verify Element Display  ${auth_register_dialog['${mobile}']}
    Verify Element Display  ${auth_register_description['${mobile}']}
    Wait Element And Click Element   ${auth_register_dialog_ok['${mobile}']}

    Log to console    Try WRONG password
    Bypass Hard Code OTP Page    000000
    Log to console    Check code is wrong...
    Verify Element Display  ${OTP_wrong_code}
    Log to console    Try CORRECT password
    Bypass Hard Code OTP Page    395749
    Log to console    Check code is correct...
    Sleep  5s
    Verify Element Not Display  ${OTP_wrong_code}

Enter OTP code correct 

    Bypass Hard Code OTP Page    395749
    Log to console    Check code is correct...
    Sleep  5s
    Verify Element Not Display  ${OTP_wrong_code}
 

Press Mobile Keypad 
    [Arguments]     ${number}   

    #Ref : https://developer.android.com/reference/android/view/KeyEvent.html#KEYCODE_0
    Run Keyword If    '${number}' == '0'    Press Keycode             7
    Run Keyword If    '${number}' == '1'    Press Keycode             8
    Run Keyword If    '${number}' == '2'    Press Keycode             9
    Run Keyword If    '${number}' == '3'    Press Keycode             10
    Run Keyword If    '${number}' == '4'    Press Keycode             11
    Run Keyword If    '${number}' == '5'    Press Keycode             12
    Run Keyword If    '${number}' == '6'    Press Keycode             13
    Run Keyword If    '${number}' == '7'    Press Keycode             14
    Run Keyword If    '${number}' == '8'    Press Keycode             15
    Run Keyword If    '${number}' == '9'    Press Keycode             16
    #ELSE      Log to Console    Keycode undefined!!!


Bypass Hard Code OTP Page
    [Arguments]     ${OTP_code}    
    [Documentation]
    ...
    ...    OTP Page
    ...  
    
    #OTP field
    Sleep  2s
    Log to console    OTP Number Input...
    @{number}    Split String To Characters    ${OTP_code}
    FOR    ${i}    IN    @{number}
        Press Mobile Keypad    ${i}
    END
    Log to console    Finished!!!

Bypass OTP Page   
    [Arguments]     ${phone_number} 
    [Documentation]
    ...
    ...    OTP Page
    ...  

    #OTP Page
    Log to console  OTP Number Input
    Verify Element Display  ${auth_otp_title['${mobile}']}
    Verify Element Display  ${auth_otp_desc['${mobile}']}
    Verify Element Display  ${auth_register_resend_btn['${mobile}']}
        
    Wait Element And Click Element   ${auth_register_resend_hint['${mobile}']}
    Verify Element Display  ${auth_register_dialog['${mobile}']}
    Verify Element Display  ${auth_register_description['${mobile}']}
    Wait Element And Click Element   ${auth_register_dialog_ok['${mobile}']}
    
    #Need to Integrate with OTP API

    #OTP field
    Wait Element And Input    ${auth_register_otp_1['${mobile}']}    ${otp_num1}
    Wait Element And Input    ${auth_register_otp_2['${mobile}']}    ${otp_num2}
    Wait Element And Input    ${auth_register_otp_3['${mobile}']}    ${otp_num3}
    Wait Element And Input    ${auth_register_otp_4['${mobile}']}    ${otp_num4}
    Wait Element And Input    ${auth_register_otp_5['${mobile}']}    ${otp_num5}
    Wait Element And Input    ${auth_register_otp_6['${mobile}']}    ${otp_num6}

# PROFILE
Check Profile   
    [Documentation]
    ...
    ...    Hello profile page (The first time)
    ...  

    # Profile
    Log to console  Check Profile Text...
    Verify Element Display  ${account_profile_avatar['${mobile}']}
    Verify Element Display  ${account_profile_welcome['${mobile}']}
    Verify Element Display  ${account_profile_uid['${mobile}']}
    Verify Element Display  ${account_profile_more['${mobile}']}

    # Profile information
    Log to console  Check Profile information...
    Wait Element And Click Element  ${account_profile_welcome['${mobile}']} 
    Verify Element Display  ${account_profile_information_text['${mobile}']}
    Verify Element Display  ${account_profile_information_avatar['${mobile}']}
        # Name, check by adding text
    Log to console  Check Name...
    ${name} =  Wait Element And Get Text  ${account_profile_information_name_box['${mobile}']}
    Wait Element And Click Element  ${account_profile_information_name_box['${mobile}']}
    Verify Element Display  ${account_profile_information_name_x['${mobile}']}
    Press Mobile Keypad  0

        # Gender, check by get text then changing gender
    Log to console  Check Gender...
    ${gender} =  Wait Element And Get Text  ${account_profile_information_gender_box['${mobile}']}
    Wait Element And Click Element  ${account_profile_information_gender_box['${mobile}']}
    IF  '${gender}' == 'Male'   
        Wait Element And Click Element  ${account_profile_information_name_select_female_text['${mobile}']}
        ${new_gender} =  Set Variable  Female
    ELSE  
        Wait Element And Click Element  ${account_profile_information_name_select_male_text['${mobile}']}
        ${new_gender} =  Set Variable  Male 
    END
    Wait Element And Click Element  ${account_profile_information_name_select_ok['${mobile}']}

        # Birthday, check by get text then changing day
    Sleep  1s 
    Log to console  Check Birthday...
    Verify Element Display  ${account_profile_information_birthday_box['${mobile}']}
    ${birthday} =  Wait Element And Get Text  ${account_profile_information_birthday_box['${mobile}']}
    Wait Element And Click Element  ${account_profile_information_birthday_box['${mobile}']}
    Sleep  1s
    IF  '${birthday}' == '01.01.2003'
        Log to console  Scrolling UP...
        Scroll   520  1130  520  1000
        ${new_birthday} =  Format String  	02.01.2003
    ELSE
        Log to console  Scrolling DOWN 
        Scroll   520  1130  520  1260 
        ${new_birthday} =  Format String  	01.01.2003
    END
    Wait Element And Click Element  ${account_profile_information_birthday_done['${mobile}']}

    # Check Save
    Log to console  Check Save...
    Wait Element And Click Element  ${account_profile_information_save_btn['${mobile}']}
    User Press Back Key
    Sleep  1s
        # Check if Name is saved
    Log to console  Check if Outside Name is Saved ...
    ${new_name} =  Format String  Hello, {}0  ${name}
    Get Text And Compare  ${account_profile_welcome['${mobile}']}  ${new_name}
    Wait Element And Click Element  ${account_profile_welcome['${mobile}']} 
    Log to console  Check if Inside Name is Saved ...
    ${new_name} =  Format String  {}0  ${name}
    Get Text And Compare  ${account_profile_information_name_box['${mobile}']}  ${new_name}
        # Check if Gender is saved
    Log to console  Check if Gender is Saved...
    Get Text And Compare  ${account_profile_information_gender_box['${mobile}']}  ${new_gender}
        # Check if Birthday is saved
    Log to console  Check if Birthday is Saved...
    Get Text And Compare  ${account_profile_information_birthday_box['${mobile}']}  ${new_birthday}
    User Press Back Key

# MY MIGO REWARD
Check My Migo Reward 
 
    Log to console  Check reward gift image...
    Verify Element Display  ${account_rewards_gift['${mobile}']}
    Log to console  Check My Reward...
    Verify Element Display  ${account_rewards_reward['${mobile}']}
    Log to console  Check gift count...
    Verify Element Display  ${account_rewards_giftcount['${mobile}']}
    Log to console  Check Migo Point...
    Verify Element Display  ${account_rewards_migo_point['${mobile}']}
    Log to console  Check reward description...
    Verify Element Display  ${account_rewards_description['${mobile}']}

    Log to console  Check My Migo reward Element...
    Click My Rewards Tab
    Sleep  1s
    Log to console  Check Migo Point...
    Verify Element Display  ${account_rewards_point_number['${mobile}']}
    Log to console  Check Migo Description...
    Verify Element Display  ${account_rewards_point_description['${mobile}']}
    Log to console  Check Migo point level...
    Verify Element Display  ${account_rewards_point_level['${mobile}']}
    Log to console  Check subpage of Migo point page...
    Log to console  Levels subpage...
    Verify Element Display  ${account_rewards_point_levels_tab['${mobile}']}
    Log to console  Earn subpage...
    Verify Element Display  ${account_rewards_point_earn_tab['${mobile}']}
    Log to console  History subpage...
    Verify Element Display  ${account_rewards_point_history_tab['${mobile}']}
    # Check Earn Page by checking texts
    Check Earn Page 
    # Check History Page by checking texts & scrollable 
    Check History Page
    # Check Levels Page by checking text & button
    Check Levels Page
    User Press Back Key
  
Check Earn Page 
    Log to console  Check Earn subpage...
    Wait Element And Click Element  ${account_rewards_point_earn_tab['${mobile}']}
    Log to console  Chek whole page...
    Verify Element Display  ${account_rewards_point_earn_list['${mobile}']}

    Log to console  Check Earn by Watching text...
    Verify Element Display  ${account_rewards_point_earn_by_watching_text['${mobile}']}
    Log to console  Check Earn by Watching...
    Verify Element Display  ${account_rewards_point_earn_by_watching_1['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_watching_2['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_watching_3['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_watching_4['${mobile}']}

    Log to console  Check Earn by Download text...
    Verify Element Display  ${account_rewards_point_earn_by_download_text['${mobile}']}
    log to console  Check Earn by Download...
    Verify Element Display  ${account_rewards_point_earn_by_download_1['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_2['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_3['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_4['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_5['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_6['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_7['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_8['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_9['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_by_download_10['${mobile}']}

Check History Page
    Log to console  Check History subpage...
    Wait Element And Click Element  ${account_rewards_point_history_tab['${mobile}']}  
    Log to console  Chek whole page...
    Verify Element Display  ${account_rewards_point_history_list['${mobile}']}
    Log to console  Check List item 1...
    Verify Element Display  ${account_rewards_point_history_list_1_1['${mobile}']}
    Verify Element Display  ${account_rewards_point_history_list_1_2['${mobile}']}
    Verify Element Display  ${account_rewards_point_history_list_1_3['${mobile}']}

    Log to console  Scrolling down...
    Scroll

    Log to console  Check List item 8...
    Verify Element Display  ${account_rewards_point_history_list_8_1['${mobile}']}
    Verify Element Display  ${account_rewards_point_history_list_8_2['${mobile}']}
    Verify Element Display  ${account_rewards_point_history_list_8_3['${mobile}']}

Check Levels Page
    Log to console  Check Levels subpage...
    Wait Element And Click Element  ${account_rewards_point_levels_tab['${mobile}']}
    Log to console  Chek whole page...
    Verify Element Display  ${account_rewards_point_levels_list['${mobile}']}
    Log to console  Check Text...
    Verify Element Display  ${account_rewards_point_levels_title['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_description['${mobile}']}
    Log to console  Check List item 1...
    Verify Element Display  ${account_rewards_point_levels_list_1_img['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_list_1_text['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_list_1_button['${mobile}']}

    Log to console  Click Claim...
    Wait Element And Click Element  ${account_rewards_point_levels_list_1_button['${mobile}']}
    log to console  Check Redeem Error Dialog...
    Sleep  2s
    Verify Element Display  ${account_rewards_point_levels_redeem_error_title['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_redeem_error_description['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_redeem_error_button['${mobile}']}
    Log to console  Click OK...
    Wait Element And Click Element  ${account_rewards_point_levels_redeem_error_button['${mobile}']}

Check Linked Phone Number

    Log to console  Check Linked Phone Number Icon
    Verify Element Display  ${account_linked_phone_number_icon['${mobile}']}
    Log to console  Check Linked Phone Number Text
    Verify Element Display  ${account_linked_phone_number['${mobile}']}
    Log to console  Check Linked Phone Number More icon
    Verify Element Display  ${account_tutorial_more['${mobile}']}

    Log to console  Check Linked Phone Number Page...
    Click Linked Phone Number Tab
    Log to console  Check Phone Number Title...
    Verify Element Display  ${account_linked_phone_number['${mobile}']}
    Log to console  Check Phone Number Text...
    Verify Element Display  ${account_linked_phone_number_text['${mobile}']}
    Log to console  Check Phone Number...
    Verify Element Display  ${account_linked_phone_number_telephone['${mobile}']}
    Log to console  Check Verify Icon...
    Verify Element Display  ${account_linked_phone_number_verified_icon['${mobile}']}
    Log to console  Check Verify Text...
    Verify Element Display  ${account_linked_phone_number_verified_text['${mobile}']}
    User Press Back Key    

#Not Done Yet
Logout
    [Documentation]
    ...
    ...    Logout Migo Account and Check some item should not be seen
    ...  
    Log to console    Click Account Tab...
    Click Account Main Tab
    Log to console    Pass!!!
    #Logout
    Log to console    Click Logout...
    Wait Element And Click Element  ${account_main_tab['${mobile}']}
    Wait Element And Click Element  ${account_logout['${mobile}']}
    Wait Element And Click Element      ${account_logout_confrim_btn['${mobile}']}
    Log to console    Pass!!!
    Sleep  2s
    #Should Not Display Payment method and Parental Control
    Log to console    Verify payment and parental option have to disappear...
    Verify Element Not Display  ${account_payment['${mobile}']}
    Verify Element Not Display  ${account_parental['${mobile}']}
    Log to console    Pass!!!


Check User Profile Information Storage   
    [Arguments]     ${fullname}=${my_fullname}    ${gender}=${my_gender}    ${birthdaty}=${my_birthdaty}     ${ig}=${my_ig}  
    [Documentation]
    ...
    ...    Check Account Data sync
    ...     

    #Check account setting
    Log to console  Verify Account profile and setting.....
    Wait Element And Click Element  ${account_profile_more['${mobile}']}
    Wait Element And Click Element  ${account_setting_profileinfo['${mobile}']}
    Get Text And Compare    ${account_profile_info_fullname['${mobile}']}   ${fullname}
    Get Text And Compare    ${account_profile_info_gender['${mobile}']}     ${gender}
    Get Text And Compare    ${account_profile_info_birthday['${mobile}']}   ${birthdaty}
    Get Text And Compare    ${account_profile_info_ig['${mobile}']}     ${ig}

Change User Profile Information Referral Code   
    #Account and setting
    Log to console  Verify Account profile and setting.....
    Wait Element And Click Element  ${account_profile_more['${mobile}']}
    Wait Element And Click Element  ${account_setting_account['${mobile}']}
    Verify Element Display  ${account_profile_info_title['${mobile}']}
    Verify Element Display  ${account_profile_info['${mobile}']}
    Verify Element Display  ${account_profile_verified['${mobile}']}
    Verify Element Display  ${account_profile_icon['${mobile}']}
    Wait Element And Click Element  ${account_profile_info_back['${mobile}']}

    Wait Element And Click Element  ${account_setting_profileinfo['${mobile}']}
    Verify Element Display  ${account_profile_info_fullname['${mobile}']}
    Verify Element Display  ${account_profile_info_gender['${mobile}']}
    Verify Element Display  ${account_profile_info_birthday['${mobile}']}
    Verify Element Display  ${account_profile_info_ig['${mobile}']}

    ${referral_code}    FakerLibrary.Random Int    min=1000    max=9999
    Wait Element And Input  ${account_profile_info_referral['${mobile}']}     ${referral_code} 
    Wait Element And Click Element  ${account_profile_info_save_btn['${mobile}']}
    Verify Element Display  ${account_profile_info_save_toast['${mobile}']}
    Wait Element And Click Element  ${account_profile_info_back['${mobile}']}
    Wait Element And Click Element  ${account_profile_info_back['${mobile}']}  

Migo Point Should Not Be Zero

    Sleep  2s
    Get Text And Not Equal    ${account_rewards_point_number['${mobile}']}    0  

Check Gift Redeem Flow
    [Documentation]
    ...
    ...    User case for Gift Redeem Flow(include error checking)
    ...     

    Verify Element Display  ${account_rewards_point_level['${mobile}']}
    Wait Element And Click Element  ${account_rewards_point_levels_gift1['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_claim_img['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_claim_title['${mobile}']}
    Wait Element And Click Element  ${account_rewards_point_levels_claim_btn['${mobile}']}

    Wait Element And Input  ${account_rewards_point_levels_claim_code_field['${mobile}']}     qaqaqa
    Wait Element And Click Element  ${account_rewards_point_levels_claim_code_confrim_btn['${mobile}']}
    Verify Element Display  ${account_rewards_point_levels_claim_code_error['${mobile}']}
    Wait Element And Click Element  ${account_rewards_point_levels_claim_code_cancel_btn['${mobile}']}
    Wait Element And Click Element  ${account_rewards_point_levels_claim_close['${mobile}']}

    Wait Element And Click Element  ${account_rewards_point_earn_tab['${mobile}']}
    Verify Element Display  ${account_rewards_point_earn_section['${mobile}']}
    Wait Element And Click Element  ${account_rewards_point_history_tab['${mobile}']}
    Verify Element Display  ${account_rewards_point_history_section['${mobile}']}

    Wait Element And Click Element  ${account_rewards_point_back_btn['${mobile}']}
 

Check Migo App Tutorail

    Log to console  Verify Migo App Tutorial
    Wait Element And Click Element  ${account_tutorial_more['${mobile}']}
    Wait Element And Click Element  ${account_tutorials_close['${mobile}']}

Check Help Center 

    Log to console  Help Center
    Wait Element And Click Element  ${account_help_more['${mobile}']}
    Verify Element Display  ${account_help_contact_us['${mobile}']}
    Get Text And Compare    ${account_help_whatsapp['${mobile}']}   	WhatsApp
    Get Text And Compare    ${account_help_whatsapp_content['${mobile}']}   	0811-281-MIGO (6446)
    Get Text And Compare    ${account_help_facebook['${mobile}']}   	Facebook Messenger
    Get Text And Compare    ${account_help_facebook_content['${mobile}']}   	@Migoindo
    Get Text And Compare    ${account_help_ig['${mobile}']}   	Instagram
    Get Text And Compare    ${account_help_ig_content['${mobile}']}   @migoindonesia
    Verify Element Display  ${account_help_termsofuse['${mobile}']}
    Verify Element Display  ${account_help_userid['${mobile}']}    

    Wait Element And Click Element  ${acount_help_back_btn['${mobile}']}
    

Check Payment Method

    Wait Element And Click Element  ${account_payment['${mobile}']}  
    Verify Element Display  ${passes_select_method_cash_radio_btn['${mobile}']}  
    Verify Element Display  ${passes_select_method_ovo_radio_btn['${mobile}']}  
    Verify Element Display  ${passes_select_method_dana_radio_btn['${mobile}']}  
    Verify Element Display  ${passes_select_method_shopeepay_radio_btn['${mobile}']}  
    Wait Element And Click Element  ${passes_select_method_save_btn['${mobile}']}  


Check Parental Control
    [Arguments]     ${level}   

    Wait Element And Click Element  ${account_parental['${mobile}']} 
    Verify Element Display  ${account_parental_home_parental_control['${mobile}']}  
    Get Text And Compare  ${account_parental_home_level['${mobile}']}   ${level}  

Get Daily Build Hash
    Log to console    Scroll!!!
    Scroll To Element And Check    ${account_version['${mobile}']}
    Log to console    Version Checked!!!
    ${tv_app_version}=    Wait Element And Get Text   ${account_version['${mobile}']}
    Log to console    Version Get !!!
    ${regex}=    Get Regexp Matches   ${tv_app_version}     \\[.*\\]
    ${version}=    Remove String   ${regex[0]}    [   ]
    Log to console  \n${version}

    [return]    ${version}

Check Transaction History
    [Arguments]     ${pass_day}   ${payment_method}    ${trans_num}    ${pass_price}       ${status} 
    [Documentation]
    ...
    ...    Check Transaction History
    ...  

    Wait Element And Click Element  ${account_transactiont['${mobile}']} 
    ${date}=    Get Current Date    result_format==%Y-%m-%d
    ${date}=    Convert Date To ddMMyyyy   ${date}
    Get Text And Contain   ${account_transactiont_thelatest_history_time['${mobile}']}   ${date}
    Get Text And Compare   ${account_transactiont_thelatest_history_day['${mobile}']}   ${pass_day}
    Get Text And Compare   ${account_transactiont_thelatest_history_method['${mobile}']}   ${payment_method}
    Get Text And Compare   ${account_transactiont_thelatest_history_trans_num['${mobile}']}   \#${trans_num}   
    Get Text And Compare   ${account_transactiont_thelatest_history_price['${mobile}']}   ${pass_price}   
    Get Text And Compare   ${account_transactiont_thelatest_history_status['${mobile}']}   ${status} 
    Press Keycode   4

Check Parental Control Page

    Wait Element And Click Element  ${account_parental['${mobile}']}

    Verify Element Display  ${account_parental_control_title['${mobile}']}
    Verify Element Display  ${account_parental_control_subtitle['${mobile}']}
    Verify Element Display  ${account_parental_control_graph['${mobile}']}
    Verify Element Display  ${account_parental_learn_more['${mobile}']}

    Wait Element And Click Element  ${account_parental_learn_more['${mobile}']}
    Verify Element Display  ${account_parental_learn_more_dialog['${mobile}']}
    Wait Element And Click Element  ${account_parental_learn_more_dialog_btn['${mobile}']}

Set Parental Control

    Wait Element And Click Element  ${account_parental_control_bar['${mobile}']}

Set PIN Code
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4}    
    [Documentation]
    ...
    ...    Set PIN Code
    ...  

    Verify Element Display  ${account_parental_set_pin['${mobile}']}
    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}

Confirm PIN Code with Error
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4}    

    Verify Element Display  ${account_parental_set_pin['${mobile}']}
    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}
    Verify Element Display  ${account_parental_set_pin_error['${mobile}']}

Confirm PIN Code
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4}    

    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}
    Wait Element And Click Element  ${account_parental_set_pin_btn['${mobile}']}

Check Default Restriction

    Get Text And Compare  ${account_parental_restriction_display['${mobile}']}    D21+


Set Content Restriction
    [Arguments]     ${restriction}     

    Run Keyword If  '${restriction}' == 'D17+'
    ...   Run Keywords
    ...   Wait Element And Click Element    ${account_parental_restriction_17_btn['${mobile}']}    
    ...   AND  
    ...   Get Text And Compare  ${account_parental_restriction_display['${mobile}']}    ${restriction}

    Run Keyword If  '${restriction}' == 'R13+'
    ...   Run Keywords
    ...   Wait Element And Click Element    ${account_parental_restriction_13_btn['${mobile}']}    
    ...   AND  
    ...   Get Text And Compare  ${account_parental_restriction_display['${mobile}']}    ${restriction}

    Wait Element And Click Element  ${account_parental_restriction_save_btn['${mobile}']}

    Get Text And Compare  ${account_parental_home_level['${mobile}']}    ${restriction} 


Change Restriction
    [Arguments]     ${restriction}   ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4}    

    Wait Element And Click Element  ${account_parental_home_change_restriction['${mobile}']}  

    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}

    Set Content Restriction   ${restriction}
 
Reset PIN Code
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4} 
    
    #New Pin code
    Wait Element And Click Element  ${account_parental_home_tv_reset_pin['${mobile}']}
    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}



Play and Check Video With PIN Code  
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4} 

    Wait Element And Click Element  ${downloads_play_video_icon['${mobile}']}

    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}
    Sleep  2s


Close Parental Control 
    [Arguments]     ${pin_code1}   ${pin_code2}    ${pin_code3}    ${pin_code4} 

    Wait Element And Click Element  ${account_parental['${mobile}']}
    Wait Element And Click Element  ${account_parental_home_parental_control['${mobile}']}

    Wait Element And Input    ${account_parental_set_pin_field1['${mobile}']}    ${pin_code1}
    Wait Element And Input    ${account_parental_set_pin_field2['${mobile}']}    ${pin_code2}
    Wait Element And Input    ${account_parental_set_pin_field3['${mobile}']}    ${pin_code3}
    Wait Element And Input    ${account_parental_set_pin_field4['${mobile}']}    ${pin_code4}
    Verify Element Display  ${account_parental_control_graph['${mobile}']}

Check Login Status
    [Documentation]
    ...
    ...    Check Login Status
    ...
    ${visible}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible
    ...    ${account_profile_welcome['${mobile}']}
    IF  ${visible} == False
        #not login
        Log to console  Check Login Status: False
    ELSE
        #login
        Log to console  Check Login Status: True
        # if login, do logout
        Log to console  Scroll Up
        Scroll   550  1500  550  1000  500
        Log to console  Click Log Out
        Wait Element And Click Element  ${account_logout['${mobile}']}
        Log to console  Click Confirm Log Out
        Wait Element And Click Element  ${account_logout_confrim_btn['${mobile}']}
        Sleep  2s
        Check Login Status
    END

Login
    Log to console    Login...
    Login Later  +62  99999999999
	Enter OTP code correct
    Log to console    Login Pass

Login to Continue
    Log to console    Login to Continue...
    Check Login to Continue Page
    Login Later  +62  99999999999
	Enter OTP code correct
    Log to console    Login Pass

Check Login to Continue Page
    Log to console    Login to Continue Page...
    Sleep  2s
    Verify Element Display  ${account_login_con_image['${mobile}']}
    Verify Element Display  ${account_login_con_title['${mobile}']}
    Verify Element Display  ${account_login_con_description['${mobile}']}
    Log to console    Click Login button
    Wait Element And Click Element  ${account_login_con_btn['${mobile}']}

Login Later
    
    [Arguments]     ${contry_code}   ${phone_number}   
    [Documentation]
    ...
    ...    Login
    ...     
    Log to console    Login Process...
    Sleep  2s

    Log to console    Input Phone number ${phone_number} 
    Input Phone Number      ${phone_number} 

Check Login Account_Login

    Log to console  Click Profile Information Tab
    Wait Element And Click Element  ${account_register_login_tab['${mobile}']} 
    Login
    Check Login Status

Check Login Account_MyRewards
    Click My Rewards Tab
    Login to Continue
    User Press Back Key
    Check Login Status

Check Login Account_LinkedPhoneNumber
    Click Linked Phone Number Tab
    Login
    User Press Back Key
    Check Login Status

Check Login Account_ParentalControl
    Click Parental Control Tab
    Login
    User Press Back Key
    Check Login Status

Check Login Account_PaymentMethods
    Click Payment Methods Tab
    Login
    User Press Back Key
    Check Login Status

Check Login Account_TransactionHistory
    Click Transaction History Tab
    Login
    User Press Back Key
    Check Login Status

Check Login Customer Support
    Click Customer Support Icon
    Login to Continue
    User Press Back Key
    Check Login Status