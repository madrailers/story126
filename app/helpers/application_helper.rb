# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def button_put(name, options = {}, html_options = {})
    button_to name, options, html_options.merge(:method => :put)
  end
end
