Feature: Manage entries
  In order to manage entries
  users should be able to view and create entries
  
  Scenario: Restrict thread creation to specific users
    Given "thread_starter" is identified as a thread-starter
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "other"
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "thread_starter"
    When I am on the entries page
    Then I should see "new entry"
