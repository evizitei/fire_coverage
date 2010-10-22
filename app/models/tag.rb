class Tag < ActiveRecord::Base
  has_many :staffing_records
  has_many :receiver_staffing_records
end
