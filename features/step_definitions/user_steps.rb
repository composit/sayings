Given /^"([^\"]*)" is identified as a thread\-starter$/ do |username|
  THREAD_STARTERS << username
end

Given /^there are no thread\-starters$/ do
  THREAD_STARTERS.clear
end

When /^I am a logged in user called "([^\"]*)"$/ do |username|
  user = Factory( :user, :username => username, :password => "testpass", :password_confirmation => "testpass" )
  visit destroy_user_session_path
  visit new_user_session_path
  fill_in( 'Username', :with => username )
  fill_in( 'Password', :with => 'testpass' )
  click_button( 'Sign in' )
end
