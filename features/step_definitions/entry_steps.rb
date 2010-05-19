Given /^the following entries:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_login"] )
      user = Factory( :user, :login => hash["user_login"] ) unless( user = User.find_by_login( hash["user_login"] ) )
      hash["user_id"] = user.id
      hash.delete( "user_login" )
    end
    Factory( :entry, hash )
  end
end

Then /^I should see the following entries in order:$/ do |table|
  all( :xpath, "//div[@class='entry']/p" ).each_with_index { |entry, index| entry.text.should include( table.hashes[index]["content"] ) }
end
