class Receiver < ActiveRecord::Base
  belongs_to :station
  belongs_to :district
  has_many :receiver_staffing_records
  
  def tag_arriving!(tag_sig)
    raise ArgumentError.new("tag signature must not be blank") if tag_sig.blank?
    tag = Tag.find_by_sig(tag_sig)
    if tag
      staffing_record = station.fetch_open_staffing_record(tag_sig)

      if staffing_record.receiver_staffing_records.current.where(:tag_id=>tag.id,:receiver_id=>self.id).count == 0
        staffing_record.receiver_staffing_records.create!(:tag=>tag,:receiver=>self)
      end
    end
  end
  
  def tag_departing!(tag_sig)
    raise ArgumentError.new("tag signature must not be blank") if tag_sig.blank?
    tag = Tag.find_by_sig(tag_sig)
    if tag
      self.receiver_staffing_records.current.where(:tag_id=>tag.id).each do |rec|
        rec.log_departure!
        rec.staffing_record.update_staffing_status!
      end
    end
  end
end
