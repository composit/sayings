Given /^the following entries:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = Factory( :user, :username => hash["user_username"] ) unless( user = User.where( :username => hash["user_username"] ).first )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    Factory( :entry, hash )
  end
end
