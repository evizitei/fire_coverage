class StaffingRecord < ActiveRecord::Base
  belongs_to :tag
  belongs_to :station
end
