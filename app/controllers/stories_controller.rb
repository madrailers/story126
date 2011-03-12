class StoriesController < ApplicationController

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:success] = 'Story Submitted!'
      redirect_to root_path
    else
      flash.now[:failure] = 'Story could not be saved'
      render :template => 'welcome/index'
    end
  end

end
