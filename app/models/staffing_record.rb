class StaffingRecord < ActiveRecord::Base
  belongs_to :tag
  belongs_to :station
  
  scope :current,where(:is_closed=>false)
  
  def initialize(params={})
    super(params)
    self.is_closed ||= false
  end
end
