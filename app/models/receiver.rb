class Receiver < ActiveRecord::Base
  belongs_to :station
  belongs_to :district
  has_many :receiver_staffing_records
  
  def initialize(attrs={})
    super(attrs)
    self.last_updated_at ||= DateTime.now
  end
  
  def station=(station)
    self.station_id = station.id
    self.district_id = station.district_id
  end
  
  def tag_arriving!(tag_sig)
    tag_traffic(tag_sig) do |tag|
      staffing_record = station.fetch_open_staffing_record(tag_sig)
      if staffing_record.receiver_staffing_records.current.where(:tag_id=>tag.id,:receiver_id=>self.id).count == 0
        staffing_record.receiver_staffing_records.create!(:tag=>tag,:receiver=>self)
      end
    end
  end
  
  def tag_departing!(tag_sig)
    tag_traffic(tag_sig) do |tag|
      self.receiver_staffing_records.current.where(:tag_id=>tag.id).each do |rec|
        rec.log_departure!
        rec.staffing_record.update_staffing_status!
      end
    end
  end
  
  def pulse!
    self.update_attributes!(:last_updated_at=>DateTime.now)
  end
protected
  def tag_traffic(tag_sig)
    raise ArgumentError.new("tag signature must not be blank") if tag_sig.blank?
    tag = district.tags.find_by_sig(tag_sig)
    if tag
      yield(tag)
    else
      raise ArgumentError.new("tag signature must be of a tag from your district")
    end
    pulse!
  end
end
