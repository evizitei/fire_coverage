require 'spec_helper'

describe District do
  it "has many users" do
    District.new.users.should eq([])
  end
  
  it "has many stations" do
    District.new.stations.should eq([])
  end
  
  it "has many tags" do
    District.new.tags.should eq([])
  end
  
  it "has many receivers" do
    District.new.receivers.should eq([])
  end
end
