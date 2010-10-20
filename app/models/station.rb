class Station < ActiveRecord::Base
  belongs_to :district
  has_many :staffing_records
end
