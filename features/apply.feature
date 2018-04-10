Feature: Apply Permit

    In order to send a request for Activity Permit
    As a Student Organization User
    I should be able to apply for a Permit

Scenario: Valid details in the apply permit form
    Given I am on the Apply Permit page
    When I click 'Apply Permit'
    Then I should see the list of pending permits


