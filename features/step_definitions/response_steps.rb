Given /^the following responses in a single exchange:$/ do |table|
  @exchange = Factory( :exchange )
  table.hashes.each do |hash|
    user = User.where( :username => hash["user_username"] ).first || Factory( :user, :username => hash["user_username"], :password => "testpass", :password_confirmation => "testpass" )
    hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    @exchange.users << user
    @exchange.save
    response = @exchange.responses.build( hash )
    response.save
  end
end

Given /^I follow "([^\"]*)" for the "([^\"]*)" response$/ do |link, response_content|
  response = @exchange.responses.where( :content => response_content ).first
  with_scope( "//div[@id='entry-#{response.id}']" ) do
    click_link( link )
  end
end

Given /^I fill in "([^\"]*)" with "([^\"]*)" for the "([^\"]*)" response$/ do |field, value, response_content|
  response = @exchange.responses.where( :content => response_content ).first
  with_scope( "//div[@id='entry-#{response.id}']" ) do
    fill_in( field, :with => value )
  end
end

Given /^I press "([^\"]*)" for the "([^\"]*)" response$/ do |button, response_content|
  response = @exchange.responses.where( :content => response_content ).first
  with_scope( "//div[@id='entry-#{response.id}']" ) do
    click_button( button )
  end
end
