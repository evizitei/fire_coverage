When /^a tag for "([^"]*)" arrives at receiver (\d+)$/ do |name, receiver_id|
  tag = Tag.find_by_name(name) || Factory(:tag,:name=>name)
  post("/rfid/tag_arrived",{:receiver=>receiver_id,:tag=>tag.sig})
end

When /^the tag for "([^"]*)" departs from receiver (\d+)$/ do |name, receiver_id|
  tag = Tag.find_by_name(name)
  post("/rfid/tag_departed",{:receiver=>receiver_id,:tag=>tag.sig})
end
