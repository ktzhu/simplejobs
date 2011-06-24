Feature: User Account Creation

  As a user
  I want to create a user account
  So I can access the jobs site
  
  Background:
    Given I am not logged in
    And a user does not exist with the username "testuser" and the password "secret"
    
  Scenario: Sign up
    When I sign up as "testuser" with the password "secret"
    Then I, "testuser", should have an account
    And I should be logged in