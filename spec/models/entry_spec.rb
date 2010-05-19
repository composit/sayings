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

  it "should default order to reverse chronological" do
    Factory( :entry, :created_at => "2002-02-02" )
    Factory( :entry, :created_at => "2003-03-03" )
    Factory( :entry, :created_at => "2001-01-01" )
    Entry.first.created_at.strftime( "%Y-%m-%d" ).should eql( "2003-03-03" )
  end
end
