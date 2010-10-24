class District < ActiveRecord::Base
  has_many :users
  has_many :stations
  has_many :receivers
  has_many :tags
end