Feature: Manage exchanges
  In order to manage exchanges
  users should be able to view and create exchanges

  Scenario: See "respond" when appropriate
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am on the exchanges page
    Then I should not see "respond"
    When I am a logged in user called "Thornton"
    And I am on the exchanges page
    Then I should not see "respond"
    When I am a logged in user called "Ganon"
    And I am on the exchanges page
    Then I should not see "respond"
    When I am a logged in user called "Link"
    And I am on the exchanges page
    Then I should see "respond"

  @javascript
  Scenario: Build exchanges
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am a logged in user called "Link"
    And I am on the exchanges page
    And I follow "respond"
    And I fill in "response" with "have a great day!"
    And I press "Create Exchange"
    Then I should see "Exchange was successfully created"
    And I should see "view exchange"
    When I follow "view exchange"
    Then I should see "have a great day!"

  @javascript
  Scenario: Derivative exchanges shouldn't show up on home page
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am a logged in user called "Link"
    And I am on the exchanges page
    And I follow "respond"
    And I fill in "response" with "have a great day!"
    And I press "Create Exchange"
    Then I should only see "Test" once

  @javascript
  Scenario: view exchanges
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test    |
    And the following comments:
      | entry_content | user_username | content |
      | Test          | Ganon         | Other   |
    When I am a logged in user called "Link"
    And I am on the exchanges page
    And I follow "respond"
    And I fill in "response" with "have a great day!"
    And I press "Create Exchange"
    And I follow "view exchange"
    Then I should see "have a great day!"

  Scenario: no comments for initial entry in an exchange on that exchange's page
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
      | Link          | Test 2  |
      | Link          | Test 3  |
    When I am on the exchanges page
    Then I should see "comment" for the "Test 1" entry
    When I am on the exchange page
    Then I should not see "comment" for the "Test 1" entry
    And I should see "comment" for the "Test 2" entry
    And I should see "comment" for the "Test 3" entry

  @javascript
  Scenario: add comments to entries
    Given the following entries in a single exchange:
      | user_username | content   |
      | person        | Test      |
      | other         | Also test |
      | person        | I concur  |
    When I am a logged in user called "Link"
    And I am on the exchange page
    And I follow "comment" for the "Also test" entry
    And I fill in "new comment" with "Me too!" for the "Also test" entry
    And I press "Create Comment" for the "Also test" entry
    Then I should be on the exchange page
    And I should see "Me too!"
    And I should see "Link - "
