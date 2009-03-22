class User < ActiveRecord::Base
  acts_as_authentic
end


# == Schema Info
# Schema version: 20090321191310
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  crypted_password    :string(255)
#  email               :string(255)
#  login               :string(255)
#  login_count         :integer(4)
#  password_salt       :string(255)
#  perishable_token    :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  created_at          :datetime
#  updated_at          :datetime