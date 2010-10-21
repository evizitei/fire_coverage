Feature: Web services for RFID receivers to post to
  As a district IT guy
  I want the RFID receivers to have webservices they can post events to
  In order to track personnel staffing effortlessly
  
  Scenario: Tag arrives at station
    Given there is an empty station named "Station 1" with an ID of 345
    When a tag for "Stephen Dunkin" arrives at station 345
    Then there should be 1 member at "Station 1"
    When a tag for "Josh Creamer" arrives at station 345
    Then there should be 2 members at "Station 1"
    
  Scenario: Tag departs station
     Given there is an empty station named "Station 1" with an ID of 345
     And there is a tag for "Stephen Dunkin" in "Station 1"
     Then there should be 1 member at "Station 1"
     When the tag for "Stephen Dunkin" departs from station 345
     Then there should be 0 members at "Station 1"