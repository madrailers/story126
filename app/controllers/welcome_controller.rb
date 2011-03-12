class WelcomeController < ApplicationController
  def index
    @story = Story.new
  end

end
