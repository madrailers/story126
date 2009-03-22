require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSession do
  before(:each) do
    @valid_attributes = {
      :login => 'username',
      :password => 'somePassword'
    }
    al_login
  end

  it "should create a new instance given valid attributes" do
    #TODO: Does this even do what we want to test?
    user_session.should_not be_nil
  end
end
