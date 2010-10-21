class AddClosedFlagToStaffingRecord < ActiveRecord::Migration
  def self.up
    add_column :staffing_records, :is_closed, :boolean
  end

  def self.down
    remove_column :staffing_records, :is_closed
  end
end
