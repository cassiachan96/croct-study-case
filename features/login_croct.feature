@logincroct
Feature: Login Croct
    As a member
    I want to log in
    So that I get access to member functionality
    
Background
Given that the user has an account in the system

    Scenario: Not registred
      Given I am on the login page
      When I fill in the following:
        | Email    | cassiachan96@gmail.com |
        | Password | secret      |
      And I press "Log in"
      Then I should see "is not valid" 
      
    Scenario: Blank form
    Given I am on the login page
    When I press "Log in"
    Then I should see "You did not provide any details for authentication"
    
    Scenario: Incorrect password
    Given a user with email "cassiachan96@gmail.com" exists
    And I am on the login page
    When I fill in the following:
      | Email    | cassiachan96@gmail.com    |
      | Password | wrong_password |
    And I press "Log in"
    Then I should see "is not valid"
    
    Scenario: Successful log in
    Given I have an account with email "cassiachan96@gmail.com" and password "secret"
    And I am on the login page
    When I fill in the following:
      | Email    | cassiachan96@gmail.com |
      | Password | secret      |
    And I press "Log in"
    Then I should be logged in
    And I should see the profile form
    And I should not see "Sign up"
    
    Scenario: Redirected when logging in
    Given I have an account with email "cassiachan96@gmail.com" and password "secret"
    When I go to the profile page
    Then I should see "You need to log in first"
    And I should see "Email"
    And I should see "Password"
    When I fill in the following:
      | Email    | cassiachan96@gmail.com |
      | Password | secret      |
    And I press "Log in"
    Then I should see the profile form
    
    Scenario: User signs in and checks "remember me" 
    Given I am signed up and confirmed as "cassiachan96@gmail.com"
    When I go to the sign in page
    And I sign in with "remember me" as "cassiachan96@gmail.com"
    Then I should see "Signed in successfully"
    And I should be signed in 
    When I return next time
    Then I should be signed in