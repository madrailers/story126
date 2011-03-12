Feature: Create a Story
  In order to have stories on the site
  As a user
  I want to submit a story

  Scenario Outline: Create a Story
    Given I am on the homepage
    When I fill in "Your Story:" with a <chars> character story
    And I press "Submit"
    Then I should see "<message>"

    Examples:
      | chars | message                  |
      | 126   | Story Submitted!         |
      | 125   | Story could not be saved |
