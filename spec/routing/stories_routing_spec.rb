require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoriesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "stories", :action => "index").should == "/stories"
    end
  
    it "maps #new" do
      route_for(:controller => "stories", :action => "new").should == "/stories/new"
    end
  
    it "maps #show" do
      route_for(:controller => "stories", :action => "show", :id => "1").should == "/stories/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "stories", :action => "edit", :id => "1").should == "/stories/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "stories", :action => "create").should == {:path => "/stories", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "stories", :action => "update", :id => "1").should == {:path =>"/stories/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "stories", :action => "destroy", :id => "1").should == {:path =>"/stories/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/stories").should == {:controller => "stories", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/stories/new").should == {:controller => "stories", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/stories").should == {:controller => "stories", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/stories/1").should == {:controller => "stories", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/stories/1/edit").should == {:controller => "stories", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/stories/1").should == {:controller => "stories", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/stories/1").should == {:controller => "stories", :action => "destroy", :id => "1"}
    end
  end
end
