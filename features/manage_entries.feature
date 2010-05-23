Feature: Manage entries
  In order to manage entries
  users should be able to view and create entries
  
  Scenario: Restrict new entry creation to specific users
    Given "exchange starter" is identified as an exchange starter
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "other user"
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "exchange starter"
    When I am on the entries page
    Then I should see "new entry"

  Scenario: Restrict new entry creation to logged in users when no exchange starters have been specified
    Given there are no exchange starters
    When I am on the entries page
    Then I should not see "new entry"
    Given I am a logged in user called "mister user"
    When I am on the entries page
    Then I should see "new entry"

  Scenario: Display content, author and date of entries
    Given the following entries:
      | content             | created_at | user_username |
      | Here's some content | 2002-02-02 | Mildred       |
      | Lorem ipsum dolor   | 2003-03-03 | Grover        |
      | Words about topics  | 2001-01-01 | Ophelia       |
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

  Scenario: Add new entries
    Given I am a logged in user called "Mister user"
    When I am on the new entry page
    And I fill in "Content" with "Bla bla bla"
    And I press "Create Entry"
    Then I should see "Entry was successfully created"
    When I am on the entries page
    Then I should see "Bla bla bla"

  Scenario: New entries are assigned to the logged in user
    Given I am a logged in user called "Mister user"
    When I am on the new entry page
    And I fill in "Content" with "Bla bla bla"
    And I press "Create Entry"
    Then I should see "Entry was successfully created"
    When I am on the entries page
    Then I should see "Bla bla bla"
    And I should see "Mister user"

  @javascript
  Scenario: Sanitize entries
    Given the following entries:
      | content                                                          |
      | <script type='text/javascript'>document.write('hello');</script> |
    When I am on the entries page
    Then I should not see "hello"

  Scenario: Autolink urls
    Given the following entries:
      | content                |
      | http://www.google.com/ |
    When I am on the entries page
    And I follow "http://www.google.com/"
    Then I should be sent to the "http://www.google.com/" webpage

  Scenario: Add comments to entry
    Given the following entries:
      | content    |
      | Test entry |
    When I am on the entries page
    And I follow "comment"
    And I fill in "comment" with "this is a test comment"
    And I press "Create comment"
    And I am on the entries page
    Then I should see "this is a test comment"

  Scenario: Entry comments default to reverse chronological order
    pending
