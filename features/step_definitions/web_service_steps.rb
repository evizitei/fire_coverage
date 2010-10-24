When /^a tag for "([^"]*)" from "([^"]*)" arrives at receiver (\d+)$/ do |name, district_name, receiver_id|
  district = District.find_by_name(district_name)
  tag = Tag.find_by_name_and_district_id(name,district.id) || Factory(:tag,:name=>name,:district_id=>district.id)
  post("/rfid/tag_arrived",{:receiver=>receiver_id,:tag=>tag.sig})
end

When /^the tag for "([^"]*)" from "([^"]*)" departs from receiver (\d+)$/ do |name, district_name, receiver_id|
  district = District.find_by_name(district_name)
  tag = Tag.find_by_name_and_district_id(name,district.id)
  post("/rfid/tag_departed",{:receiver=>receiver_id,:tag=>tag.sig})
end
