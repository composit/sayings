Given /^the following comments:$/ do |table|
  table.hashes.each do |hash|
    if( hash["entry_content"] )
      entry = Factory( :entry, :content => hash["entry_content"] ) unless( entry = Entry.where( :content => hash["entry_content"] ).first )
      hash.delete( "entry_content" )
      entry.comments << Factory.build( :comment, hash )
      entry.save
    end
  end
end
