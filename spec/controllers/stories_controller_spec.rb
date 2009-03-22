require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoriesController do

  def mock_story(stubs={})
    @mock_story ||= mock_model(Story, stubs)
  end

  def mock_errors(stubs={})
    unless @mock_errors
      @mock_errors = mock(:errors, stubs)
      @mock_errors.should_receive(:on).with(:text).and_return("error on :text")
    end
    @mock_errors
  end

  describe "GET index" do
    it "exposes all stories as @stories" do
      Story.should_receive(:find).with(:all).and_return([mock_story])
      get :index
      assigns[:stories].should == [mock_story]
    end

    describe "with mime type of xml" do

      it "renders all stories as xml" do
        Story.should_receive(:find).with(:all).and_return(stories = mock("Array of Stories"))
        stories.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    end
  end

  describe "GET show" do

    it "exposes the requested story as @story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      get :show, :id => "37"
      assigns[:story].should equal(mock_story)
    end

    describe "with mime type of xml" do

      it "renders the requested story as xml" do
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end
    end
  end

  describe "GET new" do

    it "exposes a new story as @story" do
      Story.should_receive(:new).and_return(mock_story)
      get :new
      assigns[:story].should equal(mock_story)
    end

  end

  describe "GET edit" do

    it "exposes the requested story as @story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      get :edit, :id => "37"
      assigns[:story].should equal(mock_story)
    end

  end

  describe "POST create" do
    describe "with valid params" do
      it "should show success message and redirect to root" do
        Story.should_receive(:new).with({'these' => 'params'}).and_return(mock_story(:save => true))
        post :create, :story => {:these => 'params'}
        assigns(:story).should_not equal(mock_story)
        flash[:notice].should == 'Hey! Thanks for that wonderful story!'
        response.should redirect_to(root_url)
      end
    end

    describe "with text field too short" do
      it "it redirects to '/' with the invalid story stored in flash[:text]" do
        story_mock = mock_story(:save => false, :errors => mock_errors)
        story_mock.stub!(:text).and_return("this is the text")

        Story.stub!(:new).and_return(story_mock)
        post :create, :story => story_mock
        flash.should have_key(:text)
        flash[:text].should == "this is the text"
        flash[:notice].should == "Um, something went wrong: story error on :text"
      end
    end
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested story" do
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :story => {:these => 'params'}
      end

      it "exposes the requested story as @story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => true))
        put :update, :id => "1"
        assigns(:story).should equal(mock_story)
      end

      it "redirects to the story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(story_url(mock_story))
      end
    end

    describe "with invalid params" do

      it "updates the requested story" do
        Story.should_receive(:find).with("37").and_return(mock_story)
        mock_story.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :story => {:these => 'params'}
      end

      it "exposes the story as @story" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => false))
        put :update, :id => "1"
        assigns(:story).should equal(mock_story)
      end

      it "re-renders the 'edit' template" do
        Story.stub!(:find).and_return(mock_story(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      mock_story.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the stories list" do
      Story.stub!(:find).and_return(mock_story(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(stories_url)
    end
  end

  describe "GET pending" do
    
    it "exposes all pending stories as @stories" do
      Story.should_receive(:pending).and_return([mock_story])
      al_admin
      get :pending
      assigns[:stories].should == [mock_story]
    end
    
  end
  
  describe "GET accepted" do
    it "exposes all accepted stories as @stories" do
      Story.should_receive(:accepted).and_return([mock_story])
      al_admin
      get :accepted
      assigns[:stories].should == [mock_story]
    end
  end
  
  describe "GET rejected" do
    it "exposes all rejected stories as @stories" do
      Story.should_receive(:rejected).and_return([mock_story])
      al_admin
      get :rejected
      assigns[:stories].should == [mock_story]
    end
  end

  describe "GET spam" do
    it "exposes all spam stories as @stories" do
      Story.should_receive(:spam).and_return([mock_story])
      al_admin
      get :spam
      assigns[:stories].should == [mock_story]
    end
  end

  describe "GET published" do
    it "exposes all published stories as @stories" do
      Story.should_receive(:published).and_return([mock_story])
      al_admin
      get :published
      assigns[:stories].should == [mock_story]
    end
  end
end
