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
  
  it "can have an SMS code" do
    station = Station.new(:sms_code=>"tba")
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
  
  describe "when building a current staffing message" do
    before(:each){ @station = Factory(:station,:sms_code=>"TC")}

    it "will return status 0 if empty" do
      @station.staffing_message.should == "TC: STATUS 0"
    end
    
    it "will show one name if one staffer present" do
      tag = Factory(:tag,:name=>"Dan Brothwell")
      Factory(:open_staffing_record,:tag=>tag,:station=>@station)
      @station.staffing_message.should == "TC: Brothwell"
    end
      
    it "will show two names if two staffers present" do
      tag = Factory(:tag,:name=>"Dan Brothwell")
      Factory(:open_staffing_record,:tag=>tag,:station=>@station)
      tag = Factory(:tag,:name=>"Stephen Dunkin")
      Factory(:open_staffing_record,:tag=>tag,:station=>@station)
      @station.staffing_message.should == "TC: Brothwell,Dunkin"
    end
  end
end
