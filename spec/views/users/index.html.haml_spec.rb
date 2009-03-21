require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.haml" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :login => "firstUser",
        :crypted_password => "value for crypted_password",
        :password_salt => "value for password_salt",
        :persistence_token => "value for persistence_token",
        :single_access_token => "value for single_access_token",
        :perishable_token => "value for perishable_token",
        :login_count => 42
      ),
      stub_model(User,
        :login => "secondUser",
        :crypted_password => "value for crypted_password",
        :password_salt => "value for password_salt",
        :persistence_token => "value for persistence_token",
        :single_access_token => "value for single_access_token",
        :perishable_token => "value for perishable_token",
        :login_count => 4
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "firstUser", 1)
    response.should have_tag("tr>td", "secondUser", 1)
    response.should have_tag("tr>td", 4.to_s, 1)
    response.should have_tag("tr>td", 42.to_s, 1)
  end
end

