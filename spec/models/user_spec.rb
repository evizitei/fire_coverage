require 'spec_helper'

describe User do
  it "belongs to a district" do
    district = Factory(:district)
    user = Factory(:user,:district=>district)
    user.district.should == district
  end
  
  it "has a name, an email, and a phone number" do
    user = User.new(:name=>"Ethan Vizitei",:phone=>"15732395840",:email=>"ethan.vizitei@gmail.com")
  end
  
  describe "when building a staffing response message" do
    before(:each) do
      @district = Factory(:district)
      @station = Factory(:station,:district=>@district,:sms_code=>"1")
      @user = Factory(:user,:district=>@district)
    end
    
    it "pulls from the correct station" do
      Station.any_instance.stubs(:staffing_message).returns("1: Brothwell,Dunkin")
      @user.staffing_message_for("staff 1").should == "1: Brothwell,Dunkin"
    end
    
    it "gives error if it cant find station" do
      @user.staffing_message_for("staff nope").should == "cant find station with code 'nope'"
    end
  end
end
