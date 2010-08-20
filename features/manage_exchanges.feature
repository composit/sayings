Feature: Manage exchanges
  In order to manage exchanges
  users should be able to view and create exchanges

  Scenario: See "respond" when appropriate
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Starter |
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
      | Link          | Starter |
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
    When I am on the exchanges page
    Then I should see "view exchange"
    When I follow "view exchange"
    Then I should see "have a great day!"

  @javascript
  Scenario: Derivative exchanges shouldn't show up on home page
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Starter |
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
      | Link          | Starter |
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

  Scenario: link up one level for the initial entry in an exchange on that exchange's page
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
      | Link          | Test 2  |
      | Link          | Test 3  |
    And the following comments:
      | entry_content | user_username | content    |
      | Test 3        | Ganon         | I disagree |
    And the following entries in a derivative exchange:
      | user_username | content            |
      | Link          | Well, you're wrong |
      | Ganon         | No, you're wrong   |
    When I am on the exchange page
    And I follow "up one level"
    Then I should see "Test 1"
    And I should see "Test 2"
    And I should see "Test 3"
    And I should not see "No, you're wrong"
    When I follow "up one level"
    Then I should be on the exchanges page

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

  Scenario: Entries default to reverse chronological order on exchanges page
    Given the following entries in a single exchange:
      | user_username | content             | created_at |
      | Ophelia       | Here's some content | 2002-02-02 |
    Given the following entries in a single exchange:
      | user_username | content             | created_at |
      | Ophelia       | Lorem ipsum dolor   | 2003-03-03 |
    Given the following entries in a single exchange:
      | user_username | content             | created_at |
      | Ophelia       | Words about topics  | 2001-01-01 |
    When I am on the exchanges page
    Then I should see the following text in order:
      | text                |
      | Lorem ipsum dolor   |
      | Here's some content |
      | Words about topics  |

  Scenario: Entries default to chronological order on the individual exchange page
    Given the following entries in a single exchange:
      | user_username | content             | created_at |
      | Ophelia       | Here's some content | 2002-02-02 |
      | Grover        | Lorem ipsum dolor   | 2003-03-03 |
      | Ophelia       | Words about topics  | 2001-01-01 |
    When I am on the exchange page
    Then I should see the following text in order:
      | text                |
      | Words about topics  |
      | Here's some content |
      | Lorem ipsum dolor   |

  Scenario: Restrict new exchange creation to logged in users when no exchange starters have been specified
    Given there are no exchange starters
    When I am on the exchanges page
    Then I should not see "new entry"
    Given I am a logged in user called "mister user"
    When I am on the exchanges page
    Then I should see "new entry"

  Scenario: Restrict new exchange creation to specific users
    Given "exchange starter" is identified as an exchange starter
    When I am on the exchanges page
    Then I should not see "new entry"
    Given I am a logged in user called "other user"
    When I am on the exchanges page
    Then I should not see "new entry"
    Given I am a logged in user called "exchange starter"
    When I am on the exchanges page
    Then I should see "new entry"

  Scenario: Add new entries
    Given I am a logged in user called "Mister user"
    When I am on the new exchange page
    And I fill in "Content" with "Bla bla bla"
    And I press "Create Exchange"
    Then I should see "Exchange was successfully created"
    When I am on the exchanges page
    Then I should see "Bla bla bla"

  Scenario: Only users associated with the exchange can add a response
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
    When I am on the exchange page
    Then I should not see "add response"
    When I am a logged in user called "Mister user"
    And I am on the exchange page
    Then I should not see "add response"
    When I am a logged in user called "Link"
    And I am on the exchange page
    Then I should see "add response"

  @javascript
  Scenario: Add new entries to existing exchanges
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
      | Link          | Test 2  |
      | Link          | Test 3  |
    When I am a logged in user called "Link"
    And I am on the exchange page
    And I follow "add response"
    And I fill in "response" with "good hustle, buddy"
    And I press "Create response"
    Then I should see "Response was successfully created" 
    When I am on the exchange page
    Then I should see "good hustle, buddy"

  @javascript
  Scenario: Stay on exchange page when adding entries
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
      | Link          | Test 2  |
      | Link          | Test 3  |
    When I am a logged in user called "Link"
    And I am on the exchange page
    And I follow "add response"
    And I fill in "response" with "good hustle, buddy"
    And I press "Create response"
    Then I should be on the exchange page

  Scenario: Link to user pages from entries
    Given the following entries in a single exchange:
      | user_username | content |
      | Link          | Test 1  |
    When I am on the exchange page
    And I follow "Link"
    Then I should be on the user page for "Link"
