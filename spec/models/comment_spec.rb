require 'spec_helper'

describe Comment do
  it "should create a new instance of an entry comment given valid attributes" do
    entry = Factory( :entry )
    comment = Factory.build( :comment )
    entry.comments << comment
    comment.should be_valid
  end
end
