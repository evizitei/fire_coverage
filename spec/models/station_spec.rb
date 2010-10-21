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

  describe "when tag arrives" do
    it "adds a record if one isn't open" do
      tag = Factory(:tag)
      station = Factory(:station)
      station.tag_arriving!(tag.sig)
      station.staffing_records.current.size.should == 1
      station.staffing_records.current.first.sig == tag.sig
    end
    
    it "does not add a record if one is already open" do
      tag = Factory(:tag)
      station = Factory(:station)
      rec = Factory(:open_staffing_record,:tag=>tag,:station=>station)
      station.tag_arriving!(tag.sig)
      station.staffing_records.current.size.should == 1
      station.staffing_records.current.first.sig == tag.sig
    end
  end
  
  describe "when tag departs" do
    it "closes out an open staffing record" do
      tag = Factory(:tag)
      station = Factory(:station)
      rec = Factory(:open_staffing_record,:tag=>tag,:station=>station)
      station.tag_departing!(tag.sig)
      station.staffing_records.current.size.should == 0
    end
  end
end
