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

Given /^the "(.*)" story exists$/ do |story_name|
  visit '/'
  fill_in('Start your story here', :with => auto_story(story_name))
  click_button('Create')
end

# Given /^the "(.*)" story has state "(.*)"$/ do |story_id, story_state|
  # Story.create!(:text => random_string, :id => story_id, :state => story_state)
# end

When /^I (\S*) the "(.*)" story$/ do |action, story_name|
  click_button(action)
end

When /^I mark as spam the "(.*)" story$/ do |story_name|
    click_button("spam")
end

When /^the "(.*)" story has state "(.*)"$/ do |story_name, story_state|
  visit "/stories"
  click_link('Show')
  case story_state
  when "approved"
    click_button("Approve")
  when "pending"
    click_button("Mark As Pending")
  when "rejected"
    click_button("Reject")
  when "published"
    click_button("Published")
  end
end

Then /^the "(.*)" story should have state "(.*)"$/ do |story_name, story_state|
  # Story.find(story_id).should eval("be_#{story_state}")
  visit "/stories"
  click_link('Show')
  response.body.should include(story_state)
end

Then /^Twitter should have the "(.*)" story$/ do |story_name|
  pending
end

Then /^the "(.*)" story has a recent "(.*)" field$/ do |story_id, field|
  # (Story.find(story_id))[field].should be_close(Time.now, 2.seconds)
  pending
end
