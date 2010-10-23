class RfidController < ApplicationController
  def tag_arrived
    receiver = Receiver.find(params[:receiver])
    receiver.tag_arriving!(params[:tag])
    receiver.update_attributes!(:last_updated_at=>DateTime.now)
    render :text=>nil
  end
  
  def tag_departed
    receiver = Receiver.find(params[:receiver])
    receiver.tag_departing!(params[:tag])
    receiver.update_attributes!(:last_updated_at=>DateTime.now)
    render :text=>nil
  end
  
  def pulse
    receiver = Receiver.find(params[:receiver])
    receiver.update_attributes!(:last_updated_at=>DateTime.now)
    render :text=>nil
  end
end
