require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "username",
      :password => "somePassword",
      :password_confirmation => "somePassword",
      :email => 'abc@def.com'
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end

# == Schema Info
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