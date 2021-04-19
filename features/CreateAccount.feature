@createaccountcroct
Feature: Create Account
  In order to use croct
  I need to create an user account
  
Background
Given I create a user account

  Scenario:  Successful user account creation
    Given the database contains no test data
    And I am on the homepage
    When I attempt to create the following user account:
      | email address        | password | confirm password |
      | abc@croct.com        | password | password         |
  # User is automatically logged in
    Then I should see "Welcome!" message on page
    And an ar_id is set for the user
    When I click "Sign Out"
    Then I should see "Signed out"
    When I attempt to sign in with following user account:
      | email address         | password |
      | abc@croct.com         | password |
    Then I should see "Welcome!" message on page

  Scenario Outline:  Verify error message when user failed to sign in
    Given there is a user
    And I am on the homepage
    And I try to login with email "<email address>", password "<password>"
    Then I should see "<error message>" message on page
    
    Examples:
    | email address                        | password          | error message                        |
    | testuser@croct.com                   | abc1234           | Invalid email or password            |
    | testuserdoesnotexist@croct.com       | password          | Invalid email or password            |

  Scenario Outline:  Verify error message when user failed to sign up
    Given I am on the homepage
    And I click "Sign Up"
    And I try to create user with email "<email address>", password "<password>", confirm password "<confirm password>"
    Then I should see "<error message>" message on page

  Examples:
    | email address       | password          | confirm password      | error message                        |
    | abc@croct.com       | abc123            | abc123                | Email has already been taken         |
    | xyz@test            | abc123            | abc123                | Email is invalid                     |
    | abc@croct.com       |                   | abc123                | Password can't be blank              |
    | abc@croct.com       | abc123            |                       | Password doesn't match confirmation  |
    | abc@croct.com       | abc1              | abc1                  | Password is too short                |