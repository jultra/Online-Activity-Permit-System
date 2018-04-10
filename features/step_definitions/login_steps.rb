# require 'uri'
# require 'cgi'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

When /^(?:I )click (.+)$/ do |button|
    visit buttons(button)
end

Then /^I should see (.+)$/ do |page_name|
    visit path_to(page_name)
end

When /^I log in with email "(.*?)" and password "(.*?)" and I click (.+)$/ do |email, password, button|
    fill_in 'email', with: email
    fill_in 'password', with: password
    visit buttons(button)
end

When /^I fill in activitydetails with "(.*?)" and dateandtime "(.*?)" and I click (.+)$/ do |actdetails, dateandtime, button|
    fill_in 'activitydetails', with: actdetails
    fill_in 'dateandtime', with: dateandtime
    visit buttons(button)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |room, rooms|
    select room, :from => rooms
end
  

