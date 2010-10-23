class SmsController < ApplicationController
  protect_from_forgery :except=>:incoming_sms
  def incoming_sms
    user = User.find_by_phone(params[:device_address])
    sms = Moonshado::Sms.new(user.phone, user.staffing_message_for(params[:message]))
    sms.deliver_sms
    render :text=>nil
  end
end
