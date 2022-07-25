*** Settings ***
Resource          ..${/}..${/}resources${/}variables.resource
Resource          ..${/}..${/}resources${/}libraries.resource
Resource          ..${/}..${/}resources${/}utility${/}utility_keywords.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_sell_pass.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_auth_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_account_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_catalog_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_passes_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_downloads_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_location_page.robot
Resource          ..${/}..${/}resources${/}pages${/}migo_onBoarding_page.robot
Variables         ..${/}..${/}resources${/}elements${/}migo_auth_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_catalog_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_downloads_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_location_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_passes_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_account_page.yaml
Variables         ..${/}..${/}resources${/}elements${/}migo_onBoarding_page.yaml


*** Variables ***


*** Test Cases ***
# Test
#     [Tags]    test
#     Confirm Cash Transaction of Buy Migo Passes     666666
Test Test 
    [Tags]    test
    Log to Console Dash  Hello World!


First Launch Test 
    [Tags]    All 
    # [Setup]    Launch Migo  Google_Pixel6  true
    [Setup]    Clear Data and Launch Migo  Samsung_A515F  true
    
    # ONBOARDING
	# Tutorial
    Log to console   Checking onBoarding tutorial & "Skip"...
    Click Skip in onBoarding Page
    Log to console Dash   OnBoarding Tutorial Pass
    Sleep  2s

    # Allow Migo Permission
    Log to console   Allow Migo permission...
    Allow Device Permission
    Log to console Dash   Allow Permission Pass

    # Login
    Log to console    Login...
    Register or Login First  +62  99999999999
	Enter OTP code  
    Log to console Dash   Login Pass 

	# ACCOUNT
	# View Pass
    Sleep  5s
    Click Milestone View Pass Dialog
    Log to console Dash   Milestone Dialog Pass 
	
	# Reward Intro
    Close Migo Reward Introduction Notification
    Log to console Dash   Close Reward Notification Pass
    Close In App Message
    Log to console Dash   Close In App Message Pass
    User Press Back Key

    Log to console  Checking Account Page...
    # Profile
    Log to console Dash  Check Profile
    Check Profile
    Log to Console Dash  Profile Pass

    # My Rewards
    Log to console Dash  Check My Migo Reward  
    Check My Migo Reward
    Log to Console Dash  My Migo Reward Pass

    # Linked Phone Number
    Log to console Dash  Check Linked Phone Number
    Check Linked Phone Number
    Log to Console Dash  Linked Phone Number Pass 

    # Check Account Main Tab After Login
    Log to console Dash  Migo Account Page Check Pass

    # PASSES
    # Buy 3-days Pass
    Click Passes Main Tab
    Log to console  Check onBoard Passes Tutorial
    Check the Onboard Passes Tutorials
    Check Buy Migo Pass Dialog  Paket 1 Hari    Rp 3.000   Cash  
    Continue To Pay
    # text_code -> Transaction code on web(buy pass) and history
    ${text_code} =  Buy and Active Ticket on Mitra Sell Pass
    
    Check Pass Page Element
    Log to console Dash   Pass Page Element Pass


OnBoarding Test
    [Tags]    OnBoarding_TEST  Login  NotLogin
    # [Setup]    Clear Data and Launch Migo  Google_Pixel6  true
    [Setup]    Clear Data and Launch Migo  Samsung_A505  true
    Log to console Dash   Migo APP Launch!!!

    # onBoarding Page and check if there have tutorial
    # If there is tutorial, then click Skip
    # If there is NO tutorial, then skip.
    Log to console   Checking onBoarding tutorial & "Skip"...
    Click Skip in onBoarding Page
    Log to console Dash   OnBoarding Tutorial Pass
    Sleep  2s

    # Allow Migo Permission
    Log to console   Allow Migo permission...
    Allow Device Permission
    Log to console Dash   Allow Permission Pass

    # Login
    Log to console    Login...
    Register or Login First  +62  99999999999
	Enter OTP code  

    Log to console Dash   Login Pass 


Catalog Test
    [Tags]    Catalog_TEST  
    [Setup]    Launch Migo  Google_Pixel6

    Sleep  2s
    Close In App Message
    Click Catalog Main Tab

    Log to console  Checking Catalog Page...

    # Catalog Display
    Log to console Dash  Check Catalog Page
    Check Catalog Page
    Log to Console Dash  Catalog Display Page

    # Search Page 
    Log to Console Dash  Check Search Display
    Check Search Display
    Log to Console Dash  Search Display PASS

    # Search Movie & Check Title Card
    Log to Console Dash  Check Search
    Search  John Wick: Chapter 2
    Log to console Dash  Search PASS

    # Movie Title Card 
    Log to console Dash  Check Movie Title Card 
    Check Movie Title Card  John Wick: Chapter 2
    Log to console Dash  Movie Title Card Pass

    Search  Om Nom Stories

    # Series Title Card
    Log to console Dash  Check Series Title Card 
    Check Series Title Card  Om Nom Stories
    Log to console Dash  Series Title Card Pass

    # Genre
    Log to console Dash  Check Genre 
    Check Genre 
    Log to Console Dash  Genre Pass

Account Test
    [Tags]    Account_TEST  Login
    [Setup]    Launch Migo  Samsung_A515F 
    
    Sleep  2s
    Close In App Message
    Click Account Main Tab

    Log to console  Checking Account Page...
    # Profile
    Log to console Dash  Check Profile
    Check Profile
    Log to Console Dash  Profile Pass

    # My Rewards
    Log to console Dash  Check My Migo Reward  
    Check My Migo Reward
    Log to Console Dash  My Migo Reward Pass  

    # Linked Phone Number
    Log to console Dash  Check Linked Phone Number
    Check Linked Phone Number
    Log to Console Dash  Linked Phone Number Pass 

    # Check Account Main Tab After Login
    Log to console Dash  Migo Account Page Check Pass


Passes Test
    [Tags]     Passes_TEST  Login
    [Setup]     Launch Migo  Samsung_A505
    # Buy 3-days Pass
    Click Passes Main Tab
    Check Buy Migo Pass Dialog  Paket 1 Hari    Rp 3.000   Cash  
    Continue To Pay
    # text_code -> Transaction code on web(buy pass) and history
    ${text_code} =  Buy and Active Ticket on Mitra Sell Pass
    
    Check Pass Page Element
    Log to console Dash  Pass Page Element Pass

Download Test
    [Tags]    Download_TEST  Login
    [Setup]    Launch Migo  Samsung_A515F
    
    Sleep  2s
    Close In App Message
    Click Downloads Main Tab

    Log to console  Checking Download Page...

    # download page
    Log to console Dash  Check Download page
    Check Download
    Log to Console Dash  Download page Pass

    # saving master
    Log to console Dash  Check Saving Master
    Check Saving Master
    Log to Console Dash  Saving Master Pass

    # download moive
    Log to console Dash  Check Download Movie
    Check Download Movie
    Log to Console Dash  Download Movie Pass

    # snack bar
    Log to console Dash  Check Download Bar To Download Page
    Check Download Bar To Download Page
    Log to Console Dash  Download Bar To Download Page Pass

    # download series
    Log to console Dash  Check Download Series
    Check Download Series
    Log to Console Dash  Download Series Pass

    # play video


    #manage download
    # Log to console Dash  Check Manage Downloads
    # Check Manage Downloads
    # Check Delete Single Download Video
    # Check Delete All Download Video
    # Log to Console Dash  Manage Downloads Pass


Calculate from Launch App to Catalog timer 
    [Tags]    Calculate   time 
    [Setup]    Launch Migo  Google_Pixel6    true
    [Teardown]    Close Application 
    Log to console   Start to calculate time
    ${timer1}=    Get Current Date

    Allow Device Permission

    Browse Catalog First

    Choose User Genres      Komedi      Anime       Reality

    Close In App Message

    Click Coach Icon
    
    Verify Element Display  ${catalog_carousel['${mobile}']}

    ${timer2}=    Get Current Date

    Log to console   Stop to calculate!!!

    ${time_catalog}=	Subtract Date From Date     ${timer2}        ${timer1}

    Log to console   v2.5.0 public wifi took ${time_catalog}s to see the full catalog page.

New User Onboard Tutorials and Buy Ticket to Check Transaction History
    [Tags]    e2e   newuser     abc   

    [Setup]    Launch Migo  Google_Pixel6    true
    [Teardown]    Close Application         
     
    Eliminate Test Account   +62     99999999999  
      
    Allow Device Permission

    Browse Catalog First
    
    Choose User Genres      Komedi      Anime       Reality  
    
    ${timer1}=    Get Current Date  
    Close In App Message

    # Click Coach Icon    
    
    Verify Element Display  ${catalog_carousel['${mobile}']}
    ${timer2}=    Get Current Date

    Check the Onboard Location Tutorials

    Check the Onboard Passes Tutorials

    Login Migo Account   +62     99999999999     
    # Check Hello Profile Page   
    Check First Download Page

    Click Passes Main Tab
    Check Buy Migo Pass Dialog  Paket 1 Hari    Rp 3.000   Cash  
    Continue To Pay
    # text_code -> Transaction code on web(buy pass) and history
    ${text_code}=  Buy and Active Ticket on Mitra Sell Pass   

    Click Account Main Tab
    Check Transaction History   Paket 1 Hari    Cash    ${text_code}   Rp 3.000    Succeed

    #Info
    #Layout/Asset API 
    ${time_catalog}=	Subtract Date From Date     ${timer2}        ${timer1}
    Log to console  \nUser took ${time_catalog}s to see the full catalog page.
    ${version}=   Get Daily Build Hash
    Log to console  \nDaily Build Hash ${version}

    Logout

    #Account Reset
    #curl -u account:accountr00t https://api-account.migosrv-staging.com/api/admin/accounts -XDELETE --data '{ "country_code": "+62", "phone_number": "99999999999" }'
    #Eliminate Test Account   +62     99999999999

Login Exist User and Check Data Restore 
    [Tags]    e2e   existuser     data     

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]     Run Keywords     Logout     AND    Close Application     
    
    Choose User Genres      Komedi      Anime      Reality 
    Log to console     Choose User Genres finished
    Log to console    Close in App message
    Close In App Message 
    Log to console    Close in App message finished!!!
    Click Account Main Tab
    Login Migo Account   +62     99999999998     

    Check User Profile Information Storage
    User Press Back Key
    User Press Back Key

    Log to console  Payment Method
    Check Payment Method

    Log to console  Check Parental Control
    Check Parental Control  D17+
    User Press Back Key

    Log to console  Check Download Queue
    Check Download Queue    ${my_download_queue}

    Check My Saved Items    ${my_saved_items}
    User Press Back Key

    Click Account Main Tab
    Migo Point Should Not Be Zero

Catalog Page and Video Search Happy Path                 #Fixed Search Page Element
    [Tags]    Catalog     e2e   existuser  

    [Setup]    Launch Migo  Samsung_A505    true    
    [Teardown]    Close Application

    Allow Device Permission
    Register or Login First     +62     99999999997  

    # Click Coach Icon
    Close In App Message
    Check the Onboard Location Tutorials
    Check the Onboard Passes Tutorials
    
    Click Catalog Main Tab

    Check Catalog Page

    Search Video    ${search_name} 
    Verify Title Card
    Add To Saved Items On Title Card   

Catalog Page and Saved Items Happy Path
    [Tags]    Catalog     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Account Main Tab

    Check My Saved Items    ${search_name} 
    Remove To Saved Items On Title Card


Downloan Page Happy Path 
    [Tags]    Downloan     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Check First Download Page
    #Downloan Video

    Click Downloads Main Tab
    Check File Manager
    Delete All Download Video
    Reading Download Tutorials


Location Page Happy Path
    [Tags]    Location     e2e   existuser       
  
    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application


    Click Location Main Tab
    Reading Location Tutorials 
    Check Finding Migo MDS 

    
Passes Page Happy Path
    [Tags]    Passes     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Passes Main Tab
    Check Passes Price
    Check My passes Empty
    Redeem Promocode    migoqa2022
    Activate Pass   Last Day

Check Payment Method Flow 
    [Tags]    Passes     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Passes Main Tab
    Check MDS Far Dialog

    Click Passes Main Tab
    Check Buy Migo Pass Dialog  Paket 7 Hari    Rp 10.000   Cash  
    Check Payment Method Options
    Select Payment Method   ShopeePay

    Check Not Downloaded Yet Dialog
    Check Buy Migo Pass Dialog  Paket 30 Hari    Rp 30.000   ShopeePay


Cancel Cash Transaction Flow 
    [Tags]    Passes     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Passes Main Tab
    Check Buy Migo Pass Dialog  Paket 7 Hari    Rp 10.000   ShopeePay  
    Check Payment Method Options
    Select Payment Method   Cash

    Cancel Transaction Dialog


Account Page Happy Path
    [Tags]    Passes     e2e   existuser       

    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Account Main Tab
    Check Account Main Tab After Login

    Change User Profile Information Referral Code 
    Check My Migo Reward Page
    User Press Back Key

    Check Migo App Tutorail
    Check Help Center

Exist User Change Network, Download Video and Play the Video
    #Had Pass    --------------------Need to fixed------------------
    [Tags]    networkswitch     e2e   existuser           
    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Change debug Recording Prevention

    Search Video    Skakmat
    Click Download Button on Movie Title Card

    Chick Download Bar To Download Page

    Change Wifi From Public To MDS
    
    #Verify Video is play!
    ${video_name}=    Set Variable     Skakmat 
    ${obb_info}=    Create Dictionary    obb_info1=Migo    obb_info2=DIPERSEMBAHKAN OLEH       obb_info3=Ini, cara baru.       obb_info4=VISION
    Play and Check Video    ${video_name}   ${obb_info}
    Log to Console  Video Checking Successfully!!!

Parental Control Happy Path
    [Tags]    parental     e2e   existuser  demo
    [Setup]    Launch Migo  Samsung_A505
    [Teardown]    Close Application

    Click Account Main Tab
    Check Parental Control Page

    Set Parental Control
    Set PIN Code  5   5   6   6
    Confirm PIN Code with Error  5    5    6    7 
    Confirm PIN Code    5   5   6   6

    Check Default Restriction
    Set Content Restriction     D17+

    Change Restriction  R13+   5   5   6   6

    Reset PIN Code   5   5   6   6
    Set PIN Code    7   7   8   8
    Confirm PIN Code    7   7   8   8

    User Press Back Key
    Click Downloads Main Tab
    Play and Check Video With PIN Code  7   7   8   8
    Sleep  2s
    AppiumLibrary.Capture Page Screenshot   Parental_Enable.png

    User Press Back Key
    # Wait Element And Click Element  ${downloads_video_surfaceView['${mobile}']}    
    # AppiumLibrary.Click Element At Coordinates      1180    580 
    # Wait Element And Click Element  ${downloads_video_forward_btn['${mobile}']} 
    Click Account Main Tab
    Close Parental Control  7   7   8   8

    User Press Back Key
    Click Downloads Main Tab
    Wait Element And Click Element  ${downloads_play_video_icon['${mobile}']}
    Verify Element Not Display  ${account_parental_set_pin_field1['${mobile}']}
    Sleep  2s
    AppiumLibrary.Capture Page Screenshot   Parental_Disable.png




