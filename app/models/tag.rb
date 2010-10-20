class Tag < ActiveRecord::Base
  has_many :staffing_records
end
