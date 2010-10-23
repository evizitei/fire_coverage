Feature: Request staffing for a station from the website
  As a district member
  I want to send an sms asking for the station staffing for a station, and get a response back
  In order to not have to go to the website for a staffing update

  Scenario: Fake SMS Delivery works
    When the sms message "test" is sent to "15732395840"
    Then there should be an SMS sent to "15732395840" saying "test"
  
  Scenario: Valid sms request results in staffing message sent
    Given there is a district named "BCFPD"
     And there is a station named "Station 1" in "BCFPD" with "1" as their sms code
     And there is a tag for "Stephen Dunkin" in "Station 1"
     And there is a tag for "Josh Creamer" in "Station 1"
     And there is a station named "Station 1" in "BCFPD" with "2" as their sms code
     And there is a station named "Training Center" in "BCFPD" with "TC" as their sms code
     And there is a tag for "Chuck Leake" in "Training Center"
     And there is a user in "BCFPD" named "Ethan Vizitei" with the phone number "15732395840" 
    When the user "Ethan Vizitei" sends the SMS "staff 1"
    Then there should be an SMS sent to "15732395840" saying "1: Dunkin,Creamer"
    When the user "Ethan Vizitei" sends the SMS "staff 2"
    Then there should be an SMS sent to "15732395840" saying "2: STATUS 0"
    When the user "Ethan Vizitei" sends the SMS "staff TC"
    Then there should be an SMS sent to "15732395840" saying "TC: Leake"
    