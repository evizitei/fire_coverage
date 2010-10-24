class AddDistrictIdToTagsAndReceivers < ActiveRecord::Migration
  def self.up
    add_column :tags, :district_id, :integer
    add_column :receivers, :district_id, :integer
  end

  def self.down
    remove_column :tags, :district_id
    remove_column :receivers, :district_id
  end
end
