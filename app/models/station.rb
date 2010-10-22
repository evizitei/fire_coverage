class Station < ActiveRecord::Base
  belongs_to :district
  has_many :staffing_records
  has_many :receivers
  
  def fetch_open_staffing_record(tag_sig)
    tag = Tag.find_by_sig(tag_sig)
    rec = staffing_records.current.where(:tag_id=>tag.id).first
    (rec.nil? ? staffing_records.create!(:tag=>tag) : rec)
  end
  # def tag_arriving!(tag_sig)
  #     tag = Tag.find_by_sig(tag_sig)
  #     if staffing_records.current.where(:tag_id=>tag.id).count == 0
  #       staffing_records.create!(:tag=>tag)
  #     end
  #   end
  #   
  #   def tag_departing!(tag_sig)
  #     tag = Tag.find_by_sig(tag_sig)
  #     staffing_records.current.where(:tag_id=>tag.id).each {|sr| sr.log_departure! }
  #   end
end
