Feature: Administrative Access
  In order to prevent unauthorized access
  A non-administrator
  Should be sent to the home page when trying to access admin pages

  Scenario: Non-administrator cannot view all pending stories
    Given I am not logged in
    When I am on the pending stories page
    Then I should not see "pending"

  Scenario: Non-administrator cannot view all rejected stories
    Given I am not logged in
    When I am on the rejected stories page
    Then I should not see "rejected"

  Scenario: Non-administrator cannot view all spam stories
    Given I am not logged in
    When I am on the spam stories page
    Then I should not see "spam"

