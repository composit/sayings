Given /^"([^\"]*)" is identified as an exchange starter$/ do |username|
  EXCHANGE_STARTERS << username
end

Given /^there are no exchange starters$/ do
  EXCHANGE_STARTERS.clear
end

When /^I am a logged in user called "([^\"]*)"$/ do |username|
  user = Factory( :user, :username => username, :password => "testpass", :password_confirmation => "testpass" )
  visit destroy_user_session_path
  visit new_user_session_path
  fill_in( 'Username', :with => username )
  fill_in( 'Password', :with => 'testpass' )
  click_button( 'Sign in' )
end
