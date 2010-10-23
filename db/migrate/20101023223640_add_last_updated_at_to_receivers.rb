class AddLastUpdatedAtToReceivers < ActiveRecord::Migration
  def self.up
    add_column :receivers, :last_updated_at, :timestamp
  end

  def self.down
    remove_column :receivers, :last_updated_at
  end
end
