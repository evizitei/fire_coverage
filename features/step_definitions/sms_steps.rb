When /^the user "([^"]*)" sends the SMS "([^"]*)"$/ do |name, sms_text|
  user = User.find_by_name(name)
  response = post("/sms/mo",{:device_address=>user.phone,:message=>sms_text,
                  :carrier=>"ATT",:shortcode=>"69940",:country=>"US"})
  response.should == 200
end


When /^the sms message "([^"]*)" is sent to "([^"]*)"$/ do |number, message|
  Moonshado::Sms.new(message,number).deliver_sms
end

Then /^there should be an SMS sent to "([^"]*)" saying "([^"]*)"$/ do |number, sms_text|
  messages = Moonshado::Sms.sent_messages
  messages = Moonshado::Sms.sent_messages.select{|data| 
    data[:sms][:device_address] == number and data[:sms][:message] == sms_text
  }
  messages.size.should == 1
  messages.each{|msg| Moonshado::Sms.sent_messages.delete(msg)}
end