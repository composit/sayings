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
end
