Feature: Login

    As a Student Organization User
    So I can start using the system
    I need to Login

Scenario: Logging in to my Account
    Given I am on the login page
    When I click 'Login'
    Then I should see my dashboard
