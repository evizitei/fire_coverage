class ApplicationController < ActionController::Base
  include Clearance::Authentication
  before_filter :set_timezone
  protect_from_forgery
  
  def set_timezone
    Time.zone = "America/Chicago"
  end
end
