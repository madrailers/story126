
source :rubygems

gem 'rails', '3.0.5'
gem 'pg'

gem 'compass'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'haml-rails'
gem 'html5-boilerplate'
gem "oa-oauth", :require => "omniauth/oauth"
gem 'rack-ssl', :require => 'rack/ssl'
gem 'state_machine'

gem 'awesome_print'
gem 'looksee'
gem 'wirble'

group :development do
  gem 'hitch'
  gem 'hpricot'
  gem 'ruby_parser'

  # for heroku deployment
  gem 'heroku', :require => false
  gem 'heroku_san'
  gem 'git'
  gem 'taps'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'spork'
end

group :test, :development do
  gem 'factory_girl_generator'
  gem 'gists'
  gem 'rspec-rails'
  gem 'ruby-debug19', :require => 'ruby-debug', :platforms => :ruby_19
  gem 'ruby-debug', :platforms => :ruby_18
end
