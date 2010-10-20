require 'spec_helper'

describe Station do
  it "belongs to a district" do
    district = Factory(:district)
    station = Factory(:station,:district=>district)
    station.district.should == district
  end
  
  it "has many staffing_records" do
    Station.new.staffing_records.should eq([])
  end
end
