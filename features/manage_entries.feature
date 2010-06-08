Feature: Manage entries
  In order to manage entries
  users should be able to view and create entries
  
  Scenario: Display content, author and date of entries
    Given the following entries:
      | content             | created_at | user_username |
      | Here's some content | 2002-02-02 | Mildred       |
      | Lorem ipsum dolor   | 2003-03-03 | Grover        |
      | Words about topics  | 2001-01-01 | Ophelia       |
    When I am on the exchanges page
    Then I should see "Here's some content"
    And I should see "Mildred - 02.02.2002"
    And I should see "Lorem ipsum dolor"
    And I should see "Grover - 03.03.2003"
    And I should see "Words about topics"
    And I should see "Ophelia - 01.01.2001"

  Scenario: New entries are assigned to the logged in user
    Given I am a logged in user called "Mister user"
    When I am on the new exchange page
    And I fill in "Content" with "Bla bla bla"
    And I press "Create Exchange"
    Then I should see "Exchange was successfully created"
    When I am on the exchanges page
    Then I should see "Bla bla bla"
    And I should see "Mister user"

  @javascript
  Scenario: Sanitize entries
    Given the following entries:
      | content                                                          |
      | <script type='text/javascript'>document.write('hello');</script> |
    When I am on the exchanges page
    Then I should not see "hello"

  Scenario: Autolink urls
    Given the following entries:
      | content                |
      | http://www.google.com/ |
    When I am on the exchanges page
    And I follow "http://www.google.com/"
    Then I should be sent to the "http://www.google.com/" webpage
