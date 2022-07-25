#Global variables setting...
*** Variables ***
# ``site`` for element, valid value are "stg" , "prd"
${env}    stg
# ``device_name`` for mobile
${device_name}
# ``mobile`` for element, valid value could be "android" , "ios"
${mobile}
${delay}    3s
${timeout}  10s
&{domains}    stg=https://stg-mbk.migo.com.tw
&{headers}    Content-Type=application/json    
&{CONNECT_DEVICES}   Samsung_A505=R58M73JANNN    Samsung_A515F=R58NA0G325D     HUAWEI=5BM7N18515001137    Huawei_Nova3i=JUC4C18806011525    Google_Pixel6=1A071FDF600D1E   Emulator=emulator-5554

${search_movie}  John Wick: Chapter 2
${search_series}  Om Nom Stories

#99999999998 account info
#Profile
${my_fullname}  Migouser
${my_gender}    Male
${my_birthdaty}     01.01.1994
${my_ig}    qaq
#My Rewards 
${my_rewards}   5
#Download queue
${my_download_queue}  The Perfect Husband
#Favorite movie
${my_saved_items}  The Perfect Husband

#Movie for parental control 
#R13+ media : Taxi Driver, Hello Stranger, Sumber Rezeki
${parental_control_movie}  