Then /^I show page in browser$/ do
  save_and_open_page
end

When /^I fill in "(.*)" with a (\d*) character string$/ do |field, string_length|
  fill_in(field, :with => "x"*string_length.to_i) 
end

Given /^an administrator exists$/ do
  visit '/users/new'
  fill_in('login', :with => 'admin')
  fill_in('email', :with => 'abc@def.com')
  fill_in('password', :with => 'password')
  fill_in('password confirmation', :with => 'password')
  click_button('create')
end

Given /^I am logged in as an administrator$/ do
  visit '/user_sessions/new'
  fill_in('login', :with => 'admin')
  fill_in('password', :with => 'password')
  click_button('login')
end

Given /^I am not logged in as an administrator$/ do
  visit '/user_sessions/destroy'
end

Then /^I should see all (.*) stories or "(.*)"$/i do |story_state, else_text|
  response.should have_text(/#{story_state}/i)
  response.should (have_tag("table") || have_text(/#{else_text}/i))
end
