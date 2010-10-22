class IndexAway < ActiveRecord::Migration
  def self.up
    add_index :receiver_staffing_records,"receiver_id"
    add_index :receiver_staffing_records,"is_closed"
    add_index :receiver_staffing_records,"tag_id"
    add_index :receivers,"station_id"
    add_index :stations,:district_id
    add_index :staffing_records,"tag_id"
    add_index :staffing_records,"station_id"
    add_index :staffing_records,"is_closed"
    add_index :tags,"sig"
  end

  def self.down
    remove_index :receiver_staffing_records,"receiver_id"
    remove_index :receiver_staffing_records,"is_closed"
    remove_index :receiver_staffing_records,"tag_id"
    remove_index :receivers,"station_id"
    remove_index :stations,:district_id
    remove_index :staffing_records,"tag_id"
    remove_index :staffing_records,"station_id"
    remove_index :staffing_records,"is_closed"
    remove_index :tags,"sig"
  end
end
