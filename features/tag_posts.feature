Feature: Web services for RFID receivers to post to
  As a district IT guy
  I want the RFID receivers to have webservices they can post events to
  In order to track personnel staffing effortlessly
  
  Scenario: Tag arrives at station
    Given there is an empty station named "Station 1" with an ID of 345
      And there is a receiver at "Station 1" with an ID of 678
    When a tag for "Stephen Dunkin" arrives at receiver 678
    Then there should be 1 member at "Station 1"
    When a tag for "Josh Creamer" arrives at receiver 678
    Then there should be 2 members at "Station 1"
    
  Scenario: Tag departs station
     Given there is an empty station named "Station 1" with an ID of 345
       And there is a receiver at "Station 1" with an ID of 678
       And a tag for "Stephen Dunkin" arrives at receiver 678
     Then there should be 1 member at "Station 1"
     When the tag for "Stephen Dunkin" departs from receiver 678
     Then there should be 0 members at "Station 1"
     
  Scenario: Tag travels around multiple receiver station
    Given there is an empty station named "Station 1" with an ID of 1
      And there is a receiver at "Station 1" with an ID of 23
      And there is a receiver at "Station 1" with an ID of 45
      And there is a receiver at "Station 1" with an ID of 67
      And there is a receiver at "Station 1" with an ID of 89
      And there is a receiver at "Station 1" with an ID of 321
      And there should be 0 members at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 23
    Then there should be 1 member at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 45
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 23
    Then there should be 1 member at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 67
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 45
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 67
    Then there should be 0 members at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 89
    Then there should be 1 member at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 67
    Then there should be 1 member at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 45
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 67
    Then there should be 1 member at "Station 1"
    When a tag for "Stephen Dunkin" arrives at receiver 321
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 45
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 89
    Then there should be 1 member at "Station 1"
    When the tag for "Stephen Dunkin" departs from receiver 321
    Then there should be 0 members at "Station 1"
    
    