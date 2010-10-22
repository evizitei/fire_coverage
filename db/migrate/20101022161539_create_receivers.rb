class CreateReceivers < ActiveRecord::Migration
  def self.up
    create_table :receivers do |t|
      t.integer :station_id

      t.timestamps
    end
  end

  def self.down
    drop_table :receivers
  end
end
