Given /^a user exists with username "([^"]*)" and password "([^"]*)"$/ do |username, password|
  Factory.create :user, :login => username, :password => password
end

Given /^a user exists with username "([^"]*)" and password "([^"]*)" and role "([^"]*)"$/ do |username, password, role|
  Factory.create :user, :login => username, :password => password, :role => role.to_sym
end

Given /^my user account has a role of "([^"]*)"$/ do |role|
  Factory.create :user, :role => role.to_sym
end

Then /^I should be allowed access to "([^"]*)"$/ do |page|
end