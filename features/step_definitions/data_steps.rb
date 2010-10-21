Given /^there is a district named "([^"]*)"$/ do |name|
  Factory(:district,:name=>name)
end

Given /^there is a user with email "([^"]*)" and password "([^"]*)" in "([^"]*)"$/ do |email, pass, district|
  Factory(:email_confirmed_user,:email=>email,:password=>pass,:password_confirmation=>pass,:district=>District.find_by_name(district))
end

Given /^there is a station named "([^"]*)" in "([^"]*)"$/ do |name, district|
  Factory(:station,:name=>name,:district=>District.find_by_name(district))
end

Given /^there is a tag for "([^"]*)" in "([^"]*)"$/ do |name, station|
  tag = Factory(:tag,:name=>name)
  Factory(:staffing_record,:tag=>tag,:station=>Station.find_by_name(station))
end

Given /^there is an empty station named "([^"]*)" with an ID of (\d+)$/ do |name, id|
  Factory(:station,:name=>name,:id=>id)
end

Then /^there should be (\d+) member(?:|s) at "([^"]*)"$/ do |count, station_name|
  station = Station.find_by_name(station_name)
  station.staffing_records.current.size.should eq(count.to_i)
end