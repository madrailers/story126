class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])
    # print @story.text
    
    respond_to do |format|
      if @story.save
        flash[:notice] = 'Hey! Thanks for that wonderful story!'
        format.html { redirect_to('/') }
        format.xml  { head :ok }
      else
        flash[:notice] = "Um, something went wrong: story #{@story.errors.on(:text)}"
        flash[:text] = @story.text
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
        # format.html { render :action => "new" }
        format.html { redirect_to '/'}
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /stories/pending
  def pending
    @stories = Story.pending

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # PUT /stories/1/approve
  def approve
    @story = Story.find(params[:id])
    @story.state = :approved
    respond_to do |format|
      format.html { redirect_to(pending_stories_url) }
    end
  end
  
  # PUT /stories/1/reject
  def reject
  end
  
  # PUT /stories/1/mark_as_spam
  def mark_as_spam
  end
  
  # PUT /stories/1/mark_as_pending
  def mark_as_pending
  end
  
  # PUT /stories/1/publish
  def publish
  end
end
