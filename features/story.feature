Feature: Story Submission
  In order to allow many people to submit 126 character stories
  Any user
  Should be able to submit a story that is exactly 126 characters long.

  Scenario: Correct length story is submitted, and is put in the queue
    Given I am on the home page
    # Then I show page in browser
    When I fill in "Start your story here" with a 126 character string
    And I press "Create"
    Then I should see "Hey! Thanks for that wonderful story!"

  Scenario: Too short story is submitted, and is not accepted
    Given I am on the home page
    # Then I show page in browser
    When I fill in "Start your story here" with a 125 character string
    And I press "Create"
    Then I should see "story too short. Must be exactly 126 characters without whitespace padding"

  Scenario: Too long story is submitted, and is not accepted
    Given I am on the home page
    # Then I show page in browser
    When I fill in "Start your story here" with a 127 character string
    And I press "Create"
    Then I should see "story too long. Must be exactly 126 characters without whitespace padding"

