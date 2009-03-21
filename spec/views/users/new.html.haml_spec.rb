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
      with_tag("input#user_password[name=?]", "user[password]")
      with_tag("input#user_password_confirmation[name=?]", "user[password_confirmation]")
    end
  end
end


