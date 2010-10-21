class RfidController < ApplicationController
  def tag_arrived
    station = Station.find(params[:station])
    station.tag_arriving!(params[:tag])
    render :text=>nil
  end
  
  def tag_departed
    station = Station.find(params[:station])
    station.tag_departing!(params[:tag])
    render :text=>nil
  end
end
