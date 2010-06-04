require 'spec_helper'

describe Comment do
  it "should create a new instance of an entry comment given valid attributes" do
    entry = Factory( :entry )
    comment = Factory.build( :comment )
    entry.comments << comment
    comment.should be_valid
  end

  it "should require the existence of a user" do
    comment = Factory.build( :entry, :user_id => nil )
    comment.should_not be_valid
    comment.errors[:user_id].length.should eql( 1 )
    comment.errors[:user_id].should include( "can't be blank" )
  end

  it "should create a new exchange with two entries and users" do
    user_1 = Factory( :user )
    user_2 = Factory( :user )
    entry = Factory( :entry, :content => "entry content", :user_id => user_1.id )
    comment = Factory.build( :comment, :content => "comment content", :user_id => user_2.id )
    entry.comments << comment
    entry.save
    exchange = comment.new_exchange
    exchange.users.should eql( [ user_1, user_2 ] )
    exchange.entries.collect { |entry| entry.content }.should eql( [ "entry content", "comment content" ] )
  end

  it "should create a new exchange with entry timestamps that match the original entries" do
    entry = Factory( :entry )
    comment = Factory.build( :comment )
    entry.comments << comment
    entry.save
    exchange = comment.new_exchange
    exchange.entries.all[0].created_at.should eql( entry.created_at )
    exchange.entries.all[1].created_at.should eql( comment.created_at )
  end
end
