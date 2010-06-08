Given /^the following comments:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = Factory( :user, :username => hash["user_username"] ) unless( user = User.where( :username => hash["user_username"] ).first )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    if( hash["entry_content"] )
      entry = Factory.build( :entry, :content => hash["entry_content"] ) unless( @exchange && entry = @exchange.entries.where( :content => hash["entry_content"] ).first )
      hash.merge!( { :entry => entry } ).delete( "entry_content" )
      @comment = Factory( :comment, hash )
    end
  end
end
