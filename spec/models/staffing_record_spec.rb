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
end
