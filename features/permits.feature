Feature: See Activity Permits
    In order to see the list of all activity permits
    As a Student Org
    I should be able to see all pending permits that i have submitted

Scenario: Pending Permits is clicked
    Given I am on my dashboard
    When I click 'Pending Permits'
    Then I should see the list of pending permits

Scenario: Approved Permits is clicked
    Given I am on my dashboard
    When I click 'Approved Permits'
    Then I should see the list of approved permits

Scenario: Rejected Permits is clicked
    Given I am on my dashboard
    When I click 'Rejected Permits'
    Then I should see the list of rejected permits