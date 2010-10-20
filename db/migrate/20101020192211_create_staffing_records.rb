class CreateStaffingRecords < ActiveRecord::Migration
  def self.up
    create_table :staffing_records do |t|
      t.integer :tag_id
      t.integer :station_id
      t.timestamp :arrived_at
      t.timestamp :departed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :staffing_records
  end
end
