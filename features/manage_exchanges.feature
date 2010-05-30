Feature: Manage exchanges
  In order to manage exchanges
  users should be able to view and create exchanges

  Scenario: See "add response" when appropriate
    Given the following entries:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am on the entries page
    Then I should not see "add response"
    When I am a logged in user called "Thornton"
    And I am on the entries page
    Then I should not see "add response"
    When I am a logged in user called "Ganon"
    And I am on the entries page
    Then show me the page
    Then I should not see "add response"
    When I am a logged in user called "Link"
    And I am on the entries page
    Then I should see "add response"
