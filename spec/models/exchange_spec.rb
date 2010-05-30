require 'spec_helper'

describe Exchange do
  it "should create a new instance given valid attributes" do
    Factory( :exchange ).should be_valid
  end

  it "should update the updated_at field when a reply is updated" do
    pending
  end

  it "should add users" do
    user_1 = Factory( :user )
    user_2 = Factory( :user )
    exchange = Factory( :exchange )
    exchange.users << user_1
    exchange.users << user_2
    exchange.save
    Exchange.where( :_id => exchange.id ).first.users.should eql( [user_1, user_2] )
  end

  it "should remove users" do
    user_1 = Factory( :user )
    user_2 = Factory( :user )
    exchange = Factory( :exchange )
    exchange.users << user_1
    exchange.users << user_2
    exchange.save
    exchange = Exchange.where( :_id => exchange.id ).first
    exchange.users.delete( user_1 )
    exchange.save
    Exchange.where( :_id => exchange.id ).first.users.should eql( [user_2] )
  end
end
