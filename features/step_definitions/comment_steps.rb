Given /^the following comments:$/ do |table|
  table.hashes.each do |hash|
    if( hash["user_username"] )
      user = Factory( :user, :username => hash["user_username"] ) unless( user = User.where( :username => hash["user_username"] ).first )
      hash.merge!( { "user_id" => user.id } ).delete( "user_username" )
    end
    if( hash["entry_content"] )
      entry = Factory( :entry, :content => hash["entry_content"] ) unless( @exchange && entry = @exchange.entries.where( :content => hash["entry_content"] ).first )
      hash.delete( "entry_content" )
      entry.comments << Factory.build( :comment, hash )
      entry.save
    end
  end
  @exchange.entries.each { |entry| puts "entry: #{entry.content} - #{entry.comments.length}" }
end
