Given /^the following (.*) records:$/ do |factory, table|
  table.hashes.each do |hash|
    Factory( factory, hash )
  end
end

Then /^I should debug$/ do
  debugger
end

Then /^I should be sent to the "(.*)" webpage$/ do |url|
  current_url.should eql( url )
end

Then /^the "(.*)" field should not be visible$/ do |text|
  find_field( text ).should_not be_visible
end

Then /^the "(.*)" field should be visible$/ do |text|
  find_field( text ).should be_visible
end

Then /^I should see the following text in order:$/ do |table|
  page.body.should match( Regexp.new( table.hashes.collect { |hash| hash["text"] }.join( "(.*)" ), Regexp::MULTILINE ) )
end

Then /^I should only see "(.*)" once$/ do |text|
  page.body.should match( text )
  page.body.should_not match( Regexp.new( "#{text}(.*)#{text}", Regexp::MULTILINE ) )
end
