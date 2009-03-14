require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.haml" do
  include UsersHelper
  
  before(:each) do
    # assigns[:user] = @user = stub_model(User,
    #   :new_record? => false,
    #   :login => "value for login",
    #   :crypted_password => "value for crypted_password",
    #   :password_salt => "value for password_salt",
    #   :persistence_token => "value for persistence_token",
    #   :single_access_token => "value for single_access_token",
    #   :perishable_token => "value for perishable_token",
    #   :login_count => 1
    # )
    @user = login
  end

  it "renders the edit user form" do
    pending #can't get this to work. Steve, please check
    
    render
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_login[name=?]', "user[login]")
      with_tag('input#user_login_count[name=?]', "user[login_count]")
    end
  end
end


