Feature: Apply Permit

    In order to send a request for Activity Permit
    As a Student Organization User
    I should be able to apply for a Permit

Scenario: Valid details in the apply permit form
    Given I am on the Apply Permit page
    When I fill in “Activity Details” with “Seminar” 
    And I fill in “Date and Time” with “8-12pm, Feb 3, 2018”
    And I click “Apply Permit”
    Then I should be on the List of Pending Permits page
    And I should see “Application Successful.”

Scenario: Invalid details in the apply permit form
    Given I am on the Apply Permit page
    When I fill in “Activity Details” with “Seminar” 
    And I click “Apply Permit”
    Then I should receive a message containing an "alert"
    And the Apply Permit page is loaded again. 
