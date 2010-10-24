class StaffingRecord < ActiveRecord::Base
  belongs_to :tag
  belongs_to :station
  has_many :receiver_staffing_records
  
  delegate :sig, :to => :tag  
  
  scope :current,where(:is_closed=>false)
  scope :for_today,where(["(is_closed = ?) or (departed_at >= ?)",false,DateTime.parse("#{Date.today.to_s} 1:00 AM")])
  
  def initialize(params={})
    super(params)
    self.is_closed ||= false
    self.arrived_at ||= DateTime.now
  end
  
  def log_departure!
    self.update_attributes!(:is_closed=>true,:departed_at=>DateTime.now)
  end
  
  def reopen!
    self.update_attributes!(:is_closed=>false,:departed_at=>nil)
  end
  
  def update_staffing_status!
    if self.receiver_staffing_records.current.size == 0
      self.log_departure!
    end
  end
end
