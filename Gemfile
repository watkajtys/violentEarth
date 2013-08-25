ruby '1.9.3'
source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'rabl-rails'
gem 'bson_ext'
gem "font-awesome-rails"
gem 'kaminari'
gem 'newrelic_rpm'
gem 'haml_coffee_assets'
gem 'execjs'

gem "haml", "~> 4.0.2"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'better_errors'
  gem 'pry-rails'
end

group :tools do
  gem 'rb-fsevent', :require => false 
  gem 'guard-test'
  gem 'guard-livereload'
end

group :test do
    gem "factory_girl_rails"
    gem "database_cleaner"
    gem "capybara"
    gem "capybara-webkit"
    gem 'ruby-prof'
    gem 'pry-rails'
end

group :production do
  gem 'newrelic_rpm'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
