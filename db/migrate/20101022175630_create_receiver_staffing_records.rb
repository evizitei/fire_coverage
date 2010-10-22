class CreateReceiverStaffingRecords < ActiveRecord::Migration
  def self.up
    create_table :receiver_staffing_records do |t|
      t.integer :receiver_id
      t.integer :tag_id
      t.timestamp :arrived_at
      t.timestamp :departed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :receiver_staffing_records
  end
end
