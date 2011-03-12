class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :remember_me

  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    uid = access_token['uid']
    if user = User.find_by_twitter_user_id(uid)
      user
    else
      User.new do |u|
        u.twitter_user_id = uid
      end
    end
  end

end
