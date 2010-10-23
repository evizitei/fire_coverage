class DashboardController < ApplicationController
  before_filter :authenticate
  def show
  end
  
  def todays_staffing
    @station = Station.find(params[:station])
    @recs = @station.staffing_records.for_today
    render :layout=>nil
  end
end
