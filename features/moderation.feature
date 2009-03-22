Feature: Story Moderation
  In order to filter out bad/spammy stories
  The administrator
  Should be able to view all stories and change the state of stories

  Scenario: Administrator can view all pending stories
    Given an administrator exists
    And I am logged in as an administrator
    When I am on the pending stories page
    Then I should see all pending stories or "No pending stories"

  Scenario: Administrator can view all rejected stories
    Given an administrator exists
    And I am logged in as an administrator
    When I am on the rejected stories page
    Then I should see all rejected stories or "No rejected stories"

  Scenario: Administrator can view all spam stories
    Given an administrator exists
    And I am logged in as an administrator
    When I am on the spam stories page
    Then I should see all spam stories or "No spam stories"

  Scenario: Administrator can mark a story as accepted
    Given I am logged in as an administrator
    And a story named "story1" has state "pending"
    When I am on the pending stories page
    And I accept the story "story1"
    Then the story "story1" has state "accepted"
