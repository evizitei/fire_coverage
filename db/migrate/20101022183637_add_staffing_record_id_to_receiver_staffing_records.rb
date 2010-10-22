class AddStaffingRecordIdToReceiverStaffingRecords < ActiveRecord::Migration
  def self.up
    add_column :receiver_staffing_records, :staffing_record_id, :integer
  end

  def self.down
    remove_column :receiver_staffing_records, :staffing_record_id
  end
end
