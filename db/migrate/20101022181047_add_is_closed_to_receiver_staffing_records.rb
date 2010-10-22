class AddIsClosedToReceiverStaffingRecords < ActiveRecord::Migration
  def self.up
    add_column :receiver_staffing_records, :is_closed, :boolean
  end

  def self.down
    remove_column :receiver_staffing_records, :is_closed
  end
end
