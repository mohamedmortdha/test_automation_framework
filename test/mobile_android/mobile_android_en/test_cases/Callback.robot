** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Ios  callback

*** Variables ***

*** Test Cases ***
I Succeed to make a Request callback from brand
  [Tags]  Ios_en_callback_brand
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85 
  I can make a Request Callback  Mohamd Amine  6677  66771100
  I go back to menu from model detail


I Succeed to make a Request callback from Recently Viewed
  [Tags]  Ios_en_callback_brand
  I visit a model and back to menu  Changan  CS 85 
  I select mode From Recently Viewed
  I can make a Request Callback  Mohamd Amine  6677  66770000
  I go back to menu from model details Recently Viewed 

I Succeed to make a Request callback from FAVORITES
  [Tags]  Ios_en_callback_brand
  I visit a model add it to favorites and back to menu  Audi  A6
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  A6
  I can make a Request Callback  Mohamd Amine  6677  66770000
  I go back to menu from model details favorites


I Succeed to make a Request finance callback from brand
  [Tags]  Ios_en_callback_brand
  I can navigate to List Brand
  I can navigate to List of models  Audi
  I can navigate to the details of the model  Audi  A5 Coupe
  I can make a Request finance Callback  100  2 Year  Mohamd Amine  6677  66770000  123456789012
  I go back to menu from model finance callback details  
  [Teardown]  NONE

*** Keywords ***
I can make a Request finance Callback
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  I can see model Actions buttons
  I click Finance Action button
  I passed a Finance callback Request  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}

I click Finance Action button
  Click Element  xpath=//*[@text='FINANCE']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/calculate_btn


I passed a Finance callback Request
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Input Text  id=com.kuwait.showroomz.refac:id/down_payment_txt  ${down_payment}
  Click Element  id=com.kuwait.showroomz.refac:id/two_year_text
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.ImageView
  I should sees the calculation result
  I achieved a finance call back request  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}

I achieved a finance call back request
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Click Element  id=com.kuwait.showroomz.refac:id/callback_btn
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I set civilId  ${civil_id}
  I validate Callback Request
  I should see success pop up

I should sees the calculation result
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/calculator_container

I select mode From favorites List
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name
  Click Element  id=com.kuwait.showroomz.refac:id/model_name

I select favorites Item
  Wait Until Element Is Visible  xpath=//*[@text='FAVORITES']
  Click Element  xpath=//*[@text='FAVORITES']
  Wait Until Page Contains  CAR
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_btn

I visit a model add it to favorites and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I add model to favorites List
  I go back to menu from model detail

I add model to favorites List
  Click Element  id=com.kuwait.showroomz.refac:id/favorite_img

I select mode From Recently Viewed
  # Wait Until Element Is Visible  xpath=//*[@id='com.kuwait.showroomz.refac:id/recently_recycler']
  Wait Until Element Is Visible  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]
  Click Element  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]

I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model detail

I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 


I can navigate to List of models
  [Arguments]  ${brand_name}
  I have access to List Brand
  I selects a brand with name  ${brand_name}
  I should Sees the List of model  ${brand_name}

I can navigate to the details of the model
  [Arguments]  ${brand_name}  ${model_name}
  I have access to the List of models
  I selects model with name  ${model_name}
  I should Sees the details of the model  ${model_name}

I can make a Request Callback
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I can see model Actions buttons
  # I click Callback Action button
  # I passed a callback Request  ${nom_user}  ${false_phone_number}  ${phone_number}


I passed a callback Request
 [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I validate Callback Request
  I should see success pop up

I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${civil_id}

I cannot proceed Callback Request
  Page Should Contain Element  com.kuwait.showroomz.refac:id/ok_btn

I validate Callback Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s
I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  2s
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/full_name_edit  ${full_name}

I set Phone Number
  [Arguments]  ${phone_number}
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/phone_edit
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${false_phone_number}


I have access to callback popup
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/full_name_edit
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/phone_edit

I can see model Actions buttons
  I have access to model details screen  
  Click Element  id=com.kuwait.showroomz.refac:id/click_here_up_icon

  I can sees list of actions

I click Callback Action button
  Click Element  xpath=//*[@text='CALLBACK']

I have access to model details screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name_txtV


I can sees list of actions
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/grid_actions_container

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//*[@text='${model_name}'] 

I selects model with name
  [Arguments]  ${model_name}

  FOR  ${i}  IN RANGE  20
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[@text='${model_name}']
  Exit For Loop If  ${present}
  Swipe By Percent  50  80  50  20  1000
  END
  Click Element  xpath=//*[@text='${model_name}']
 ]
I have access to the List of models
  Wait Until Element Is Visible  xpath=//*[@text="Main Showroom"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_recycler
  Wait Until Page Contains  ${brand_name}


I selects a brand with name
  [Arguments]  ${brand_name}
  FOR  ${i}  IN RANGE  20
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[contains(@text,'${brand_name}')]
  Exit For Loop If  ${present}
  Swipe By Percent  50  80  50  20  1000
  END
  Click Element  xpath=//*[contains(@text,'${brand_name}')]

I have access to List Brand
  I Should Sees List Brands

I have access to Dashborad Screen
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]

I navigate to List Brand
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  # Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]

I Should Sees List Brands
  ${elements}=  Get WebElements  id=com.kuwait.showroomz.refac:id/brands_recycler
  Should Not Be Empty  ${elements}