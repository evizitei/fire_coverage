class ReceiverStaffingRecord < ActiveRecord::Base
  belongs_to :receiver
  belongs_to :tag
  belongs_to :staffing_record
  
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