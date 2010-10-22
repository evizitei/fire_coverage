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
  
  it "has many receivers" do
    Station.new.receivers.should eq([])
  end
  
  describe "when fetching a staffing record" do
    it "will create a new staffing record if one doesn't exist" do
      station = Factory(:station)
      tag = Factory(:tag)
      rec = station.fetch_open_staffing_record(tag.sig)
      station.staffing_records.current.size.should == 1
      station.staffing_records.current.first.sig.should == tag.sig
    end
  end
end
