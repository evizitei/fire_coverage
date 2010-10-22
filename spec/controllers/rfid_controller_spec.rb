require 'spec_helper'

describe RfidController do
  describe "when a tag arrives" do
    it "finds the related receiver and dispatches arrival" do
      receiver = mock("receiver")
      Receiver.expects(:find).with("37").returns(receiver)
      receiver.expects(:tag_arriving!).with("rf12")
      post :tag_arrived, :receiver=>"37", :tag=>"rf12"
    end
  end
  
  describe "when a tag departs" do
    it "finds the related receiver and dispatches departure" do
      receiver = mock("receiver")
      Receiver.expects(:find).with("37").returns(receiver)
      receiver.expects(:tag_departing!).with("rf12")
      post :tag_departed, :receiver=>"37", :tag=>"rf12"
    end
  end
end
