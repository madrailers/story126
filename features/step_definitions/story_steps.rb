When /^I fill in "([^"]*)" with a (\d+) character story$/ do |field, number|
  characters = ('a'..'z').to_a + [' ']
  story = (1..number.to_i).map{|x| random_in(characters)}.join('')
  When('I fill in "%s" with "%s"' % [field, story])
end
