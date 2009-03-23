module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the home +page/i
      root_path
    
    # Add more page name => path mappings here
    when /the pending stories page/i
      pending_stories_path
    
    when /the spam stories page/i
      spam_stories_path
    
    when /the rejected stories page/i
      rejected_stories_path
    
    when /the approved stories page/i
      approved_stories_path
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
