require 'spec_helper'

describe Response do
  it "should create a new instance given valid attributes" do
    Factory( :response ).should be_valid
  end

  it "should require the existence of a user" do
    response = Factory.build( :response, :user_id => nil )
    response.should_not be_valid
    response.errors[:user_id].length.should eql( 1 )
    response.errors[:user_id].should include( "can't be blank" )
  end

  it "should not be allowed comments if it is the initial response in an exchange" do
    exchange = Factory( :exchange )
    first_response = exchange.responses.build( :user_id => User.create.id )
    second_response = exchange.responses.build( :user_id => User.create.id )
    first_response.comments.build
    second_response.comments.build
    exchange.save
    first_response.errors.length.should eql( 1 )
    first_response.errors[:base].should include( "Comments are not allowed for this record" )
    second_response.errors.length.should eql( 0 )
  end
end
