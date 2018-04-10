# require 'uri'
# require 'cgi'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Then /^I should see (.+)$/ do |page_name|
    visit path_to(page_name)
end

When /^(?:I )click (.+)$/ do |button|
    visit buttons(button)
end

