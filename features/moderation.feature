Feature: Story Moderation
  In order to filter out bad/spammy stories
  The administrator
  Should be able to view all stories and change the state of stories

  Scenario: Administrator can view all pending stories
    Given "administrator" user exists
    And I am logged in as "administrator"
    When I am on the pending stories page
    Then I should see all pending stories or "No pending stories"

  Scenario: Administrator can view all rejected stories
    Given "administrator" user exists
    And I am logged in as "administrator"
    When I am on the rejected stories page
    Then I should see all rejected stories or "No rejected stories"

  Scenario: Administrator can view all spam stories
    Given "administrator" user exists
    And I am logged in as "administrator"
    When I am on the spam stories page
    Then I should see all spam stories or "No spam stories"

  Scenario: Administrator can mark a story as accepted
    Given "administrator" user exists
    And I am logged in as "administrator"
    And a story with id "1" has state "pending"
    When I am on the pending stories page
    And I approve the story with id "1"
    Then the story with id "1" has state "approved"
    And I should see "Story approved"

  Scenario: Administrator can mark a story as rejected
    Given "administrator" user exists
    And I am logged in as "administrator"
    And a story with id "2" has state "pending"
    When I am on the pending stories page
    And I reject the story with id "2"
    Then the story with id "2" has state "rejected"
    And I should see "Story rejected"

  Scenario: Administrator can mark a story as spam
    Given "administrator" user exists
    And I am logged in as "administrator"
    And a story with id "3" has state "pending"
    When I am on the pending stories page
    And I mark as spam the story with id "3"
    Then the story with id "3" has state "spam"
    And I should see "Story marked as spam"

  Scenario: Administrator can publish a story
    Given "administrator" user exists
    And I am logged in as "administrator"
    And a story with id "4" has state "approved"
    When I am on the approved stories page
    And I publish the story with id "4"
    Then the story with id "4" has state "published"
    And I should see "Story published"
    And Twitter should have the story with id "4"
