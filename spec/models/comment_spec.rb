require 'spec_helper'

describe Comment do
  it "should create a new instance of an entry comment given valid attributes" do
    entry = Factory( :entry )
    comment = Factory.build( :comment )
    entry.comments << comment
    comment.should be_valid
  end

  it "should create a new exchange with two replies and users" do
    user_1 = Factory( :user )
    user_2 = Factory( :user )
    entry = Factory( :entry, :content => "entry content", :user_id => user_1.id )
    comment = Factory.build( :comment, :content => "comment content", :user_id => user_2.id )
    entry.comments << comment
    entry.save
    exchange = comment.new_exchange
    exchange.users.to_a.should eql( [ user_1, user_2 ] )
    exchange.replies.collect { |reply| reply.content }.should eql( [ "entry content", "comment content" ] )
  end
end
