require 'spec_helper'

describe Exchange do
  it "should create a new instance given valid attributes" do
    Factory( :exchange ).should be_valid
  end

  it "should update the updated_at field when an entry is updated" do
    pending
  end
end
