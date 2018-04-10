Feature: Calendar
    In order to see the available dates to be reserved a certain room
    As a Student Organization
    I should be able to see the calendar

Scenario: Go to Calendar
    Given I am on my dashboard
    When I click 'See Calendar'
    Then I should see calendar
