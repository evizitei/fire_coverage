require 'spec_helper'

describe Receiver do
  it "belongs to a station" do
    station = Factory(:station)
    receiver = Factory(:receiver,:station=>station)
    receiver.station.should == station
  end
  
  it "belongs to a district" do
    district = Factory(:district)
    receiver = Factory(:receiver,:district=>district)
    receiver.district.should == district
  end
  
  it "should update the district when the station changes" do
    district = Factory(:district)
    station = Factory(:station,:district=>district)
    receiver = Factory(:receiver)
    receiver.station = station
    receiver.save
    receiver.reload
    receiver.station.should == station
    receiver.district.should == district
  end
  
  it "has many staffing records" do
    Receiver.new.receiver_staffing_records.should == []
  end
  
  describe "tag traffic: " do
    before(:each) do
      @tag = Factory(:tag)
      @station = Factory(:station)
      @receiver = Factory(:receiver,:station=>@station)
    end
    
    describe "when tag arrives" do
      it "fails loudly when tag sig is null" do
        lambda{@receiver.tag_arriving!(nil)}.should raise_error(ArgumentError)
      end
      
      it "fails loudly when tag sig is blank" do
        lambda{@receiver.tag_arriving!("")}.should raise_error(ArgumentError)
      end
      
      it "adds a record to the station if one isn't open" do
        @receiver.tag_arriving!(@tag.sig)
        @station.staffing_records.current.size.should == 1
        @station.staffing_records.current.first.sig == @tag.sig
      end
      
      it "references the sending receiver" do
        @receiver.tag_arriving!(@tag.sig)
        @receiver.receiver_staffing_records.current.size.should == 1
        @receiver.receiver_staffing_records.current.first.sig == @tag.sig
      end
    
      it "does not add a record if one is already open" do
        rec = Factory(:open_staffing_record,:tag=>@tag,:station=>@station)
        @receiver.tag_arriving!(@tag.sig)
        @station.staffing_records.current.size.should == 1
        @station.staffing_records.current.first.sig == @tag.sig
      end
      
      it "creates one staff record and two receiver records when arriving at 2 receivers at once" do
        other_receiver = Factory(:receiver,:station=>@station)
        @receiver.tag_arriving!(@tag.sig)
        other_receiver.tag_arriving!(@tag.sig)
        @station.staffing_records.current.size.should == 1
        @station.staffing_records.current.first.receiver_staffing_records.current.size.should == 2
      end
      
      it "keeps my record open when I only depart from one of the receivers" do
        other_receiver = Factory(:receiver,:station=>@station)
        rec = Factory(:staffing_record,:tag=>@tag,:station=>@station)
        Factory(:receiver_staffing_record,:tag=>@tag,:staffing_record=>rec,:receiver=>@receiver)
        Factory(:receiver_staffing_record,:tag=>@tag,:staffing_record=>rec,:receiver=>other_receiver)
        @receiver.tag_departing!(@tag.sig)
        @station.staffing_records.current.size.should == 1
        @station.staffing_records.current.first.receiver_staffing_records.current.size.should == 1
        @receiver.receiver_staffing_records.current.size.should == 0
        other_receiver.receiver_staffing_records.current.size.should == 1
      end
    end
  end
end
