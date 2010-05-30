Given /^the following entries:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = User.where( :username => hash["user_username"] ).first || Factory( :user, :username => hash["user_username"] )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    Factory( :entry, hash )
  end
end
