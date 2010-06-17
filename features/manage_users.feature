Feature: Manage users
  In order to view user details and history
  users should be able to access user pages

  Scenario: Display exchange history
    Given the following entries:
      | user_username | content |
      | Phillip       | Test 1  |
      | Phillip       | Test 2  |
      | Morris        | NoShow  |
      | Phillip       | Test 3  |
    When I am on the user page for "Phillip"
    Then I should see "Test 1"
    And I should see "Test 2"
    And I should see "Test 3"
    And I should not see "NoShow"

  Scenario: Display exchange history in order
    Given the following entries:
      | user_username | content | created_at |
      | Phillip       | Test 1  | 2003-03-03 |
      | Phillip       | Test 2  | 2001-01-01 |
      | Phillip       | Test 3  | 2002-02-02 |
    When I am on the user page for "Phillip"
    Then I should see the following text in order:
      | text   |
      | Test 1 |
      | Test 3 |
      | Test 2 |

  Scenario: Display first entry by user regardless of whether it's the first entry in the exchange
    pending
