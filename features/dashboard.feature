Feature: See overall district status
  As a department chief
  I want to see who's in all of my stations
  In order to make staffing decisions
  
  Scenario: See registered personnel in 3 stations
    Given there is a district named "BCFPD"
      And there is a user with email "ethan.vizitei@gmail.com" and password "bcfdmo" in "BCFPD"
      And there is a station named "Station 1" in "BCFPD"
      And there is a station named "Station 2" in "BCFPD"
      And there is a station named "Station 3" in "BCFPD"
      And there is a tag for "Stephen Dunkin" in "Station 1"
      And there is a tag for "Josh Creamer" in "Station 1"
      And there is a tag for "Travis Kirsten" in "Station 2"
      And there is a tag for "Victoria Tex" in "Station 3"
    When I login with "ethan.vizitei@gmail.com" and "bcfdmo"
    Then I should see "Station Staffing for BCFPD"
      And I should see "Station 1"
      And I should see "Stephen Dunkin" within ".Station_1"
      And I should see "Josh Creamer" within ".Station_1"
      And I should see "Station 2"
      And I should see "Travis Kirsten" within ".Station_2"
      And I should see "Station 3"
      And I should see "Victoria Tex" within ".Station_3"
      
  
  