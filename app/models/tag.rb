class Tag < ActiveRecord::Base
  belongs_to :district
  has_many :staffing_records
  has_many :receiver_staffing_records
end
