require 'spec_helper'

describe User do
  it "belongs to a district" do
    district = Factory(:district)
    user = Factory(:user,:district=>district)
    user.district.should == district
  end
end
