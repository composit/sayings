Given /^"([^\"]*)" is identified as a thread\-starter$/ do |login|
  THREAD_STARTERS << login
end

When /^I am a logged in user called "([^\"]*)"$/ do |login|
  user = Factory( :user, :login => login, :password => "testpass", :password_confirmation => "testpass" )
  visit login_path
  fill_in( 'Login', :with => login )
  fill_in( 'Password', :with => 'testpass' )
  click_button( 'Log in' )
end
