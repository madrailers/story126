require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stories/new.html.erb" do
  include StoriesHelper
  
  before(:each) do
    assigns[:story] = stub_model(Story,
      :new_record? => true,
      :text => "value for text",
      :user_id => 1
    )
  end

  it "renders new story form" do
    render
    
    response.should have_tag("form[action=?][method=post]", stories_path) do
      with_tag("textarea#story_text[name=?]", "story[text]")
      # with_tag("input#story_user_id[name=?]", "story[user_id]")
    end
  end
end


