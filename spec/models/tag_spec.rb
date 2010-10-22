require 'spec_helper'

describe Tag do
  it "has a field for the tag signature" do
    tag = Tag.new(:sig=>"nrf5")
    tag.sig.should == "nrf5"
  end
  
  it "has many staffing_records" do
    Tag.new.staffing_records.should eq([])
  end
  
  it "has many receiver_staffing_records" do
    Tag.new.receiver_staffing_records.should eq([])
  end
end
