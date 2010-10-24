class Station < ActiveRecord::Base
  belongs_to :district
  has_many :staffing_records,:dependent=>:destroy
  has_many :receivers,:dependent=>:destroy
  
  def fetch_open_staffing_record(tag_sig)
    tag = Tag.find_by_sig(tag_sig)
    rec = staffing_records.current.where(:tag_id=>tag.id).first
    return rec if rec
    rec = staffing_records.where(["tag_id = ? and departed_at >= ?",tag.id,3.minutes.ago]).first
    if rec
      rec.reopen!
      return rec
    end
    staffing_records.create!(:tag=>tag)
  end
  
  def staffing_message
    recs = self.staffing_records.current
    if recs.size == 0
      "#{sms_code}: STATUS 0"
    else
      "#{sms_code}: #{recs.map{|r| r.tag.name.split(/\s/).last}.join(",")}"
    end
  end
end
