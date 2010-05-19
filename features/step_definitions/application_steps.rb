Given /^the following (.*) records:$/ do |factory, table|
  table.hashes.each do |hash|
    Factory( factory, hash )
  end
end

Then /^I should debug$/ do
  debugger
end
