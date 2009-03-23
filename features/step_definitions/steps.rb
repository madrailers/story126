Then /^I show page in browser$/ do
  save_and_open_page
end

When /^I fill in "(.*)" with a (\d*) character string$/ do |field, string_length|
  fill_in(field, :with => "x"*string_length.to_i) 
end

Given /^"(.*)" user exists$/ do |login|
  visit '/users/new'
  fill_in('login', :with => 'admin')
  fill_in('email', :with => 'abc@def.com')
  fill_in('password', :with => 'password')
  fill_in('password confirmation', :with => 'password')
  click_button('create')
end

Given /^I am logged in as "(.*)"$/ do |login|
  visit '/user_sessions/new'
  fill_in('login', :with => 'admin')
  fill_in('password', :with => 'password')
  click_button('login')
end

Given /^I am not logged in$/ do
  visit '/user_sessions/destroy'
end

Then /^I should see all (.*) stories or "(.*)"$/i do |story_state, else_text|
  response.should have_text(/#{story_state}/i)
  response.should (have_tag("table") || have_text(/#{else_text}/i))
end

Given /^there are no stories$/ do
  Story.delete_all
end

Given /^a story with id "(.*)" has state "(.*)"$/ do |story_id, story_state|
  Story.create!(:text => random_string, :id => story_id, :state => story_state)
end

When /^I (\S*) the story with id "(.*)"$/ do |action, story_id|
  within("tr#story_#{story_id}") {
    click_link(action)
  }
end

When /^I mark as spam the story with id "(.*)"$/ do |story_id|
  within("tr#story_#{story_id}") {
    click_link("spam")
  }
end

Then /^the story with id "(.*)" has state "(.*)"$/ do |story_id, story_state|
  Story.find(story_id).should eval("be_#{story_state}")
end

Then /^Twitter should have the story with id "4"$/ do
  pending
end
