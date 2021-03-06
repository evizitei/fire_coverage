Factory.define :district do |d|
  d.name "BCFD"
end

Factory.define :station do |s|
  s.name "Station 14"
end

Factory.define :receiver do |r|
end

Factory.sequence :tag_sig do |n|
  "F#{n}k#{n+1}"
end

Factory.define :tag do |t|
  t.name "Ethan Vizitei"
  t.sig { Factory.next :tag_sig }
end

Factory.define :staffing_record do |s|
end

Factory.define :open_staffing_record,:parent=>:staffing_record do |s|
  s.is_closed false
end

Factory.define :closed_staffing_record,:parent=>:staffing_record do |s|
  s.is_closed true
end

Factory.define :receiver_staffing_record do |s|
end

Factory.define :open_receiver_staffing_record,:parent=>:receiver_staffing_record do |s|
  s.is_closed false
end

Factory.define :closed_receiver_staffing_record,:parent=>:receiver_staffing_record do |s|
  s.is_closed true
end

