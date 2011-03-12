class StoriesController < ApplicationController

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:success] = 'Story Submitted!'
    else
      flash[:failure] = 'Story could not be saved'
    end
    redirect_to root_path
  end

end
