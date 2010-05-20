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
