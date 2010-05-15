Feature: Manage entries
  In order to manage entries
  users should be able to view and create entries
  
  Scenario: Restrict thread creation to specific users
    Given "thread starter" is identified as a thread-starter
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "other user"
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "thread starter"
    When I am on the entries page
    Then I should see "new entry"

  Scenario: Restrict thread creation to logged in users when no thread-starters have been specified
    Given there are no thread-starters
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "mister user"
    When I am on the entries page
    Then I should see "new entry"
