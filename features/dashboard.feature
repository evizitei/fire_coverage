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
    When I sign in as "ethan.vizitei@gmail.com/bcfdmo"
    Then I should see "Station Staffing for BCFPD"
      And I should see "Station 1"
      And I should see "Stephen Dunkin" within ".station[data_tag='Station 1']"
      And I should see "Josh Creamer" within ".station[data_tag='Station 1']"
      And I should see "Station 2"
      And I should see "Travis Kirsten" within ".station[data_tag='Station 2']"
      And I should see "Station 3"
      And I should see "Victoria Tex" within ".station[data_tag='Station 3']"
  
  @javascript
  Scenario: Looking at today's staffing details
    Given there is a district named "BCFPD"
      And there is a user with email "ethan.vizitei@gmail.com" and password "bcfdmo" in "BCFPD"
      And there is a station named "Station 1" in "BCFPD"
      And there is a tag for "Stephen Dunkin" in "Station 1"
      And there is a tag for "Josh Creamer" in "Station 1"
    When I sign in as "ethan.vizitei@gmail.com/bcfdmo"
    Then I should see "Station Staffing for BCFPD"
    When I follow "Station 1"
    Then I should see "Todays Staffing for Station 1"