require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stories/show.html.erb" do
  include StoriesHelper
  before(:each) do
    assigns[:story] = @story = stub_model(Story,
      :text => "value for text",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ text/)
    response.should have_text(/1/)
  end
end

