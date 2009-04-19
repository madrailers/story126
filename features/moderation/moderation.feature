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
    And there are no stories
    And the "silly" story exists
    When I am on the pending stories page
    And I approve the "silly" story
    Then I should see "Story approved"
    And the "silly" story should have state "approved"
    And the "silly" story has a recent "approved_at" field

  Scenario: Administrator can mark a story as rejected
    Given "administrator" user exists
    And I am logged in as "administrator"
    And there are no stories
    And the "scary" story exists
    When I am on the pending stories page
    And I reject the "scary" story
    Then I should see "Story rejected"
    And the "scary" story should have state "rejected"
    And the "scary" story has a recent "rejected_at" field

  Scenario: Administrator can mark a story as spam
    Given "administrator" user exists
    And I am logged in as "administrator"
    And there are no stories
    And the "sad" story exists
    When I am on the pending stories page
    And I mark as spam the "sad" story
    Then I should see "Story marked as spam"
    And the "sad" story should have state "spam"
    And the "sad" story has a recent "marked_as_spam_at" field

  Scenario: Administrator can publish a story
    Given "administrator" user exists
    And I am logged in as "administrator"
    And there are no stories
    And the "cool" story exists
    And the "cool" story has state "approved"
    When I am on the approved stories page
    And I publish the "cool" story
    Then I should see "Story published"
    And the "cool" story should have state "published"
    And Twitter should have the "cool" story
    And the "cool" story has a recent "published_at" field
