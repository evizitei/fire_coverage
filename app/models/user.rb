class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :district
end
