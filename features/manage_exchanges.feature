Feature: Manage exchanges
  In order to manage exchanges
  users should be able to view and create exchanges

  Scenario: See "respond" when appropriate
    Given the following entries:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am on the entries page
    Then I should not see "respond"
    When I am a logged in user called "Thornton"
    And I am on the entries page
    Then I should not see "respond"
    When I am a logged in user called "Ganon"
    And I am on the entries page
    Then I should not see "respond"
    When I am a logged in user called "Link"
    And I am on the entries page
    Then I should see "respond"

  @javascript
  Scenario: Build exchanges
    Given the following entries:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am a logged in user called "Link"
    And I am on the entries page
    And I follow "respond"
    And I fill in "response" with "have a great day!"
    And I press "Create Exchange"
    Then I should see "Response was successfully created"
    And I should see "view exchange"
    When I follow "view exchange"
    Then I should see "have a great day!"

  @javascript
  Scenario: view exchanges
    Given the following entries:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am a logged in user called "Link"
    And I am on the entries page
    And I follow "respond"
    And I fill in "response" with "have a great day!"
    And I press "Create Exchange"
    And I follow "view exchange"
    Then I should see "have a great day!"
