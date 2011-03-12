Feature: Create a Story
  In order to have stories on the site
  As a user
  I want to submit a story

  Scenario: Create a Story
    Given I am on the homepage
    When I fill in "Your Story:" with a 126 character story
    And I press "Submit"
    Then I should see "Story Submitted!"
