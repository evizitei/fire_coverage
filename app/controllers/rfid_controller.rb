class RfidController < ApplicationController
  def tag_arrived
    receiver = Receiver.find(params[:receiver])
    receiver.tag_arriving!(params[:tag])
    render :text=>nil
  end
  
  def tag_departed
    receiver = Receiver.find(params[:receiver])
    receiver.tag_departing!(params[:tag])
    render :text=>nil
  end
  
  def pulse
    receiver = Receiver.find(params[:receiver])
    receiver.pulse!
    render :text=>nil
  end
end
