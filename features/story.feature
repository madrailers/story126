Feature: Story Submission
  In order to allow many people to submit 126 character stories
  Any user
  Should be able to submit a story that is exactly 126 characters long.

  Scenario: Correct length story is submitted, and is put in the queue
    Given I am on the home page
    Then I show page in browser
    When I fill in "Start your story here:" with "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456"
    And I press "Create"
    Then I should see "Hey! Thanks for that wonderful story!"