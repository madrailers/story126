require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Story do
  before(:each) do
    @valid_attributes = {
      :text => "x"*126,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Story.create!(@valid_attributes)
  end
  
  describe :text do
    it "should be no less than 126 characters"
    it "should be no more than 126 characters"
  end
end
