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
    al_login
    @user = current_user
    @user.should_receive(:login).and_return('the username')
    @user.should_receive(:login_count).and_return(42)
    assigns[:user] = @user
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/the\ username/)
    response.should have_text(/42/)
  end
end

