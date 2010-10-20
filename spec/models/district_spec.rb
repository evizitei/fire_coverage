require 'spec_helper'

describe District do
  it "has many users" do
    District.new.users.should eq([])
  end
  
  it "has many stations" do
    District.new.stations.should eq([])
  end
end
