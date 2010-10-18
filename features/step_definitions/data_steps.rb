Given /^there is a district named "([^"]*)"$/ do |name|
  Factory(:district,:name=>name)
end

Given /^there is a user with email "([^"]*)" and password "([^"]*)" in "([^"]*)"$/ do |email, pass, district|
  Factory(:user,:email=>email,:password=>pass,:district=>District.find_by_name(district))
end

Given /^there is a station named "([^"]*)" in "([^"]*)"$/ do |name, district|
  Factory(:station,:name=>name,:district=>District.find_by_name(district))
end

Given /^there is a tag for "([^"]*)" in "([^"]*)"$/ do |name, station|
  tag = Factory(:tag,:name=>name)
  Factory(:staffing_record,:tag=>tag,:station=>Station.find_by_name(station))
end
