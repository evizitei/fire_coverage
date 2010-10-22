require 'spec_helper'

describe ReceiverStaffingRecord do
  it "belongs to a receiver" do
    receiver = Factory(:receiver)
    rec = Factory(:receiver_staffing_record,:receiver=>receiver)
    rec.receiver.should == receiver
  end
  
  it "belongs to a tag" do
    tag = Factory(:tag)
    rec = Factory(:receiver_staffing_record,:tag=>tag)
    rec.tag.should == tag
  end
  
  it "belongs to a staffing record" do
    parent = Factory(:staffing_record)
    rec = Factory(:receiver_staffing_record,:staffing_record=>parent)
    rec.staffing_record.should == parent
  end
  
  it "has a scope for being current" do
    tag = Factory(:tag)
    rec = Factory(:open_receiver_staffing_record,:tag=>tag)
    ReceiverStaffingRecord.current.index(rec).should eq(0)
  end
  
  it "doesn't include closed records in the current scope" do
    tag = Factory(:tag)
    rec = Factory(:closed_receiver_staffing_record,:tag=>tag)
    ReceiverStaffingRecord.current.index(rec).should eq(nil)
  end
  
  it "defaults the closed flag to false" do
    ReceiverStaffingRecord.new.is_closed.should == false
  end
  
  it "sets the arrival timestamp at creation" do
    ReceiverStaffingRecord.new.arrived_at.should_not == nil
  end
  
  describe "when logging departure of a tag" do
    it "sets the closed flag" do
      rec = Factory(:open_receiver_staffing_record)
      rec.log_departure!
      rec.is_closed.should == true
    end
    
    it "sets the departed at timestamp" do
      rec = Factory(:open_receiver_staffing_record)
      rec.log_departure!
      rec.departed_at.should_not == nil
    end
  end
end
