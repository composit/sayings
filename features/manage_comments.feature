Feature: Manage comments
  In order to manage comments
  users should be able to view and create comments
  
  @javascript
  Scenario: Open commenting box
    Given the following entries:
      | content    |
      | Test entry |
    When I am on the entries page
    Then the "new comment" field should not be visible
    When I follow "comment"
    Then the "new comment" field should be visible

  @javascript
  Scenario: Add comments to entry
    Given the following entries:
      | content    |
      | Test entry |
    When I am on the entries page
    And I follow "comment"
    And I fill in "comment" with "this is a test comment"
    And I press "Create Comment"
    And I am on the entries page
    Then I should see "this is a test comment"

  Scenario: Entry comments default to reverse the order they were entered in after their entry
    Given the following entry records:
      | content             | created_at |
      | Here's some content | 2002-02-02 |
      | Words about topics  | 2001-01-01 |
    And the following comments:
      | entry_content       | content     |
      | Words about topics  | howdy       |
      | Here's some content | super       |
      | Here's some content | great       |
      | Here's some content | pretty good |
    When I am on the entries page
    Then I should see the following text in order:
      | text                |
      | Here's some content |
      | pretty good         |
      | great               |
      | super               |
      | Words about topics  |
      | howdy               |
