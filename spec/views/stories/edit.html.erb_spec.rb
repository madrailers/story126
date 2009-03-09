require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stories/edit.html.erb" do
  include StoriesHelper
  
  before(:each) do
    assigns[:story] = @story = stub_model(Story,
      :new_record? => false,
      :text => "value for text",
      :user_id => 1
    )
  end

  it "renders the edit story form" do
    render
    
    response.should have_tag("form[action=#{story_path(@story)}][method=post]") do
      with_tag('input#story_text[name=?]', "story[text]")
      with_tag('input#story_user_id[name=?]', "story[user_id]")
    end
  end
end


