class StaffingRecord < ActiveRecord::Base
  belongs_to :tag
  belongs_to :station
  
  delegate :sig, :to => :tag  
  
  scope :current,where(:is_closed=>false)
  
  def initialize(params={})
    super(params)
    self.is_closed ||= false
    self.arrived_at ||= DateTime.now
  end
  
  def log_departure!
    self.update_attributes!(:is_closed=>true,:departed_at=>DateTime.now)
  end
end
