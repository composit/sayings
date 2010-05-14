require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    Factory( :user ).should be_valid
  end

  it "should create a new instance given a valid website_url" do
    Factory.build( :user, :website_url => "http://www.google.com" ).should be_valid
  end

  it "should create a new instance without a website_url" do
    Factory.build( :user, :website_url => "" ).should be_valid
  end

  it "should not create a new instance given an invalid website_url" do
    user = Factory.build( :user, :website_url => "http://abc" )
    user.should_not be_valid
    user.errors.length.should eql( 1 )
    user.errors[:website_url].should include( "is not formatted properly or is not responding." )
  end
end
