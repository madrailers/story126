require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.haml" do
  include UsersHelper
  
  before(:each) do
    # assigns[:user] = stub_model(User,
    assigns[:user] = mock_model(User,
      :new_record? => false,
      :login => "value for login",
      :crypted_password => "value for crypted_password",
      :password_salt => "value for password_salt",
      :persistence_token => "value for persistence_token",
      :single_access_token => "value for single_access_token",
      :perishable_token => "value for perishable_token",
      :login_count => 1,
      :email => 'email@address.com'
    )
  end

  it "renders the edit user form" do
    render
    
    response.should have_tag("form[method=post]") do
      with_tag('input#user_login[name=?]', "user[login]")
      with_tag('input#user_email[name=?]', "user[email]")
      with_tag('input#user_password[name=?]', "user[password]")
      with_tag('input#user_password_confirmation[name=?]', "user[password_confirmation]")
    end
  end
end


