Given /^the following entries:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = Factory( :user, :username => hash["user_username"] ) unless( user = User.where( :username => hash["user_username"] ).first )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    Factory( :entry, hash )
  end
end

Then /^I should see the following entries in order:$/ do |table|
  all( "//div[@class='entry']/p" ).each_with_index { |entry, index| entry.text.should include( table.hashes[index]["content"] ) }
end
