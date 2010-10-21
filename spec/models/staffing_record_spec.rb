require 'spec_helper'

describe StaffingRecord do
  it "belongs to a station" do
    station = Factory(:station)
    rec = Factory(:staffing_record,:station=>station)
    rec.station.should == station
  end
  
  it "belongs to a tag" do
    tag = Factory(:tag)
    rec = Factory(:staffing_record,:tag=>tag)
    rec.tag.should == tag
  end
  
  it "delegates the sig method to the tag" do
    tag = Factory(:tag)
    rec = Factory(:staffing_record,:tag=>tag)
    rec.sig.should == tag.sig
  end
  
  it "has a scope for being current" do
    tag = Factory(:tag)
    rec = Factory(:open_staffing_record,:tag=>tag)
    StaffingRecord.current.index(rec).should eq(0)
  end
  
  it "doesn't include closed records in the current scope" do
    tag = Factory(:tag)
    rec = Factory(:closed_staffing_record,:tag=>tag)
    StaffingRecord.current.index(rec).should eq(nil)
  end
  
  it "defaults the closed flag to false" do
    StaffingRecord.new.is_closed.should == false
  end
  
  it "sets the arrival timestamp at creation" do
    StaffingRecord.new.arrived_at.should_not == nil
  end
end
