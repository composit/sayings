Feature: Manage comments
  In order to manage comments
  users should be able to view and create comments
  
  @javascript
  Scenario: Open commenting box
    Given the following entries:
      | content    |
      | Test entry |
    And I am a logged in user called "Downward Facing Dog"
    When I am on the exchanges page
    Then the "new comment" field should not be visible
    When I follow "comment"
    Then the "new comment" field should be visible

  @javascript
  Scenario: Close commenting box
    Given the following entries:
      | content    |
      | Test entry |
    And I am a logged in user called "Downward Facing Dog"
    When I am on the exchanges page
    When I follow "comment"
    Then the "new comment" field should be visible
    When I follow "comment"
    Then the "new comment" field should not be visible

  @javascript
  Scenario: Add comments to entry
    Given the following entries:
      | content    |
      | Test entry |
    And I am a logged in user called "Downward Facing Dog"
    When I am on the exchanges page
    And I follow "comment"
    And I fill in "comment" with "this is a test comment"
    And I press "Create Comment"
    And I am on the exchanges page
    Then I should see "this is a test comment"

  Scenario: Entry comments default to reverse the order they were entered in after their entry
    Given the following entries in a single exchange:
      | content             | created_at |
      | Here's some content | 2003-03-03 |
      | Initial entry       | 2001-01-01 |
      | Words about topics  | 2002-02-02 |
    And the following comments:
      | entry_content       | content     |
      | Words about topics  | howdy       |
      | Here's some content | super       |
      | Here's some content | great       |
      | Here's some content | pretty good |
    And I am a logged in user called "Downward Facing Dog"
    When I am on the exchange page
    Then I should see the following text in order:
      | text                |
      | Initial entry       |
      | Words about topics  |
      | howdy               |
      | Here's some content |
      | pretty good         |
      | great               |
      | super               |

  @javascript
  Scenario: clicking comments when not signed in redirects to the login page
    Given the following entries:
      | content    |
      | Test entry |
    When I am on the exchanges page
    And I follow "comment"
    Then I should be on the new user session page
