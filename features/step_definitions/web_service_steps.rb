When /^a tag for "([^"]*)" arrives at (\d+)$/ do |name, station_id|
  tag = Factory(:tag,:name=>name)
  post("/rfid/tag_arrived",{:station=>station_id,:tag=>tag.sig}) 
end
