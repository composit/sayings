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

  Scenario: Display content, author and date of entries
    Given the following entries:
      | content             | created_at | user_login |
      | Here's some content | 2002-02-02 | Mildred    |
      | Lorem ipsum dolor   | 2003-03-03 | Grover     |
      | Words about topics  | 2001-01-01 | Ophelia    |
    When I am on the entries page
    Then I should see "Here's some content"
    And I should see "Mildred - 02.02.2002"
    And I should see "Lorem ipsum dolor"
    And I should see "Grover - 03.03.2003"
    And I should see "Words about topics"
    And I should see "Ophelia - 01.01.2001"

  Scenario: Entries default to reverse chronological order
    Given the following entry records:
      | content             | created_at |
      | Here's some content | 2002-02-02 |
      | Lorem ipsum dolor   | 2003-03-03 |
      | Words about topics  | 2001-01-01 |
    When I am on the entries page
    Then I should see the following entries in order:
      | content             |
      | Lorem ipsum dolor   |
      | Here's some content |
      | Words about topics  |
