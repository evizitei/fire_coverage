When /^a tag for "([^"]*)" arrives at station (\d+)$/ do |name, station_id|
  tag = Factory(:tag,:name=>name)
  post("/rfid/tag_arrived",{:station=>station_id,:tag=>tag.sig}) 
end

When /^the tag for "([^"]*)" departs from station (\d+)$/ do |name, station_id|
  tag = Tag.find_by_name(name)
  post("/rfid/tag_departed",{:station=>station_id,:tag=>tag.sig})
end