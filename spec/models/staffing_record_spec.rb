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
  
  it "has many receiver staffing records" do
    StaffingRecord.new.receiver_staffing_records.should == []
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
  
  describe "when logging departure of a tag" do
    it "sets the closed flag" do
      rec = Factory(:open_staffing_record)
      rec.log_departure!
      rec.is_closed.should == true
    end
    
    it "sets the departed at timestamp" do
      rec = Factory(:open_staffing_record)
      rec.log_departure!
      rec.departed_at.should_not == nil
    end
  end
  
  describe "when checking whether record should still be open" do
    before(:each) do
      @rec = Factory(:open_staffing_record)
    end
    
    it "closes out if there are no receiver staffing records" do
      @rec.update_staffing_status!
      @rec.is_closed.should == true
    end
    
    it "stays open if there are two receiver staffing records" do
      Factory(:open_receiver_staffing_record,:staffing_record=>@rec)
      Factory(:open_receiver_staffing_record,:staffing_record=>@rec)
      @rec.update_staffing_status!
      @rec.is_closed.should == false
    end
    
    it "stays open if there is one open and one closed receiver staffing records" do
      Factory(:closed_receiver_staffing_record,:staffing_record=>@rec)
      Factory(:open_receiver_staffing_record,:staffing_record=>@rec)
      @rec.update_staffing_status!
      @rec.is_closed.should == false
    end
    
    it "closes out if there are 2 closed receiver staffing records" do
      Factory(:closed_receiver_staffing_record,:staffing_record=>@rec)
      Factory(:closed_receiver_staffing_record,:staffing_record=>@rec)
      @rec.update_staffing_status!
      @rec.is_closed.should == true
    end
  end
end
