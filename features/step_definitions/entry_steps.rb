Given /^the following entries:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = User.where( :username => hash["user_username"] ).first || Factory( :user, :username => hash["user_username"] )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    Factory( :entry, hash )
  end
end

Given /^the following entrie in a single exchange:$/ do |table|
  @exchange = Factory( :exchange )
  table.hashes.each do |hash|
    user = User.where( :username => hash["user_username"] ).first || Factory( :user, :username => hash["user_username"], :password => "testpass", :password_confirmation => "testpass" )
    hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    @exchange.users << user
    @exchange.save
    entry = @exchange.entries.build( hash )
    entry.save
  end
end

Given /^I follow "([^\"]*)" for the "([^\"]*)" entry$/ do |link, entry_content|
  entry = @exchange.entries.where( :content => entry_content ).first
  with_scope( "//div[@id='entry-#{entry.id}']" ) do
    click_link( link )
  end
end

Given /^I fill in "([^\"]*)" with "([^\"]*)" for the "([^\"]*)" entry$/ do |field, value, entry_content|
  entry = @exchange.entries.where( :content => entry_content ).first
  with_scope( "//div[@id='entry-#{entry.id}']" ) do
    fill_in( field, :with => value )
  end
end

Given /^I press "([^\"]*)" for the "([^\"]*)" entry$/ do |button, entry_content|
  entry = @exchange.entries.where( :content => entry_content ).first
  with_scope( "//div[@id='entry-#{entry.id}']" ) do
    click_button( button )
  end
end
