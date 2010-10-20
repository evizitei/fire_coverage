class AddDistrictIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :district_id, :integer
  end

  def self.down
    remove_column :users, :district_id
  end
end
