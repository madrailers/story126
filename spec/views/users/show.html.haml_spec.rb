require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.haml" do
  include UsersHelper
  before(:each) do
    # assigns[:user] = @user = stub_model(User,
    #   :login => "value for login",
    #   :crypted_password => "value for crypted_password",
    #   :password_salt => "value for password_salt",
    #   :persistence_token => "value for persistence_token",
    #   :single_access_token => "value for single_access_token",
    #   :perishable_token => "value for perishable_token",
    #   :login_count => 1
    # )
    assigns[:user] = @user = current_user
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ login/)
    response.should have_text(/1/)
  end
end

