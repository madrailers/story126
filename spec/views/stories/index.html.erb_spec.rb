require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stories/index.html.erb" do
  include StoriesHelper
  
  before(:each) do
    assigns[:stories] = [
      stub_model(Story,
        :text => "value for text",
        :user_id => 1
      ),
      stub_model(Story,
        :text => "value for text",
        :user_id => 1
      )
    ]
  end

  it "renders a list of stories" do
    render
    response.should have_tag("tr>td", "value for text".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

