class AddSmsCodeToStations < ActiveRecord::Migration
  def self.up
    add_column :stations, :sms_code, :string
  end

  def self.down
    remove_column :stations, :sms_code
  end
end
