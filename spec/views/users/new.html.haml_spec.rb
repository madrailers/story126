require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.html.haml" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :login => "value for login",
      :crypted_password => "value for crypted_password",
      :password_salt => "value for password_salt",
      :persistence_token => "value for persistence_token",
      :single_access_token => "value for single_access_token",
      :perishable_token => "value for perishable_token",
      :login_count => 1
    )
  end

  it "renders new user form" do
    render
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_login[name=?]", "user[login]")
      with_tag("input#user_crypted_password[name=?]", "user[crypted_password]")
      with_tag("input#user_password_salt[name=?]", "user[password_salt]")
      with_tag("input#user_persistence_token[name=?]", "user[persistence_token]")
      with_tag("input#user_single_access_token[name=?]", "user[single_access_token]")
      with_tag("input#user_perishable_token[name=?]", "user[perishable_token]")
      with_tag("input#user_login_count[name=?]", "user[login_count]")
    end
  end
end


