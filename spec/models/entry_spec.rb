require 'spec_helper'

describe Entry do
  it "should create a new instance given valid attributes" do
    Factory( :entry ).should be_valid
  end

  it "should require the existence of a user" do
    entry = Factory.build( :entry, :user_id => nil )
    entry.should_not be_valid
    entry.errors[:user_id].length.should eql( 1 )
    entry.errors[:user_id].should include( "can't be blank" )
  end

  it "should not be allowed comments if it is the initial entry in an exchange associated with a comment" do
    exchange = Factory( :exchange )
    first_entry = exchange.entries.build( :user_id => User.create.id, :created_at => "2001-01-01" )
    second_entry = exchange.entries.build( :user_id => User.create.id, :created_at => "2002-02-02" )
    first_entry.comments.build
    second_entry.comments.build
    first_entry.save
    first_entry.errors.length.should eql( 1 )
    first_entry.errors[:base].should include( "Comments are not allowed for this record" )
    second_entry.save
    second_entry.errors.length.should eql( 0 )
  end
end
