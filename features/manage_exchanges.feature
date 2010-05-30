Feature: Manage exchanges
  In order to manage exchanges
  users should be able to view and create exchanges

  Scenario: See "add response" when appropriate
    Given the following entries:
      | user_username | content |
      | link          | Test    |
    And the following comments:
      | entry_content | content |
      | Test          | Other   |
    When I am on the entries page
    Then I should not see "add response"
    When I am a logged in user called "Thornton"
    And I am on the entries page
    Then I should not see "add response"
    When I am a logged in user called "Link"
    And I am on the entries page
    Then I should see "add response"
