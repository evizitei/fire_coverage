class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :district
  
  def staffing_message_for(message)
    code = message.gsub("staff","").strip
    station = self.district.stations.find_by_sms_code(code)
    if station
      station.staffing_message
    else
      "cant find station with code '#{code}'"
    end
  end
end
