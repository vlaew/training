source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'

gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

gem 'devise' # Users authorization
gem 'carrierwave' # Image uploads

group :development, :test do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # mutes assets log
  gem 'quiet_assets'
  gem 'pry-rails'

  gem 'better_errors' # better errors pages (https://github.com/charliesome/better_errors)
  gem 'binding_of_caller' # console for better errors

  gem 'rspec-rails', '~> 3.0' # Test framework
  gem 'guard-rspec', require: false # Auto test
  gem 'factory_girl_rails' # Firxture replacement, test data generator
  gem 'database_cleaner' # Cleans database before and after tests
  gem 'capybara' # Test framework
  # gem 'capybara-webkit'
  gem 'selenium-webdriver' # Driver
  # gem 'poltergeist' # Driver

  # # Deploy with Capistrano
  # gem 'capistrano', github: 'capistrano/capistrano'
  gem 'capistrano-rails', github: 'capistrano/rails'
  gem 'capistrano-rvm', github: 'capistrano/rvm'
  gem 'capistrano-bundler', github: 'capistrano/bundler'
  gem 'capistrano3-nginx_unicorn'
  gem 'capistrano-foreman', '~> 1.2.0'

  # Code tools and metrics
  gem 'bullet' # N + 1 query problem detector
  gem 'simplecov', require: false # code coverage
  gem 'traceroute' # Helps to clean up unused routes and unreachable actions
  # gem 'rack-mini-profiler' # Mini profiler
  gem 'brakeman', require: false # Static analyzer for security vulnerabilities
  gem 'rails_best_practices' # Code metric tool to check the quality of code
  gem 'rubocop', require: false # Static style code analyzer
  gem 'rubycritic', require: false # Static code analyzer: smell

  gem 'nyan-cat-formatter' # RSpec formatter
end
