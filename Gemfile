source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'will_paginate', '> 3.0'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'sqlite3', :group => [:test, :development]
gem 'hirb', :group => [:development]
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'

  #gem 'twitter-bootstrap-rails'
end
gem 'bootstrap-sass', '~> 2.0.1'

gem 'jquery-rails'
gem 'carrierwave'
gem 'fog'
gem 'backbone-on-rails'
gem 'ancestry'
gem 'devise',           '~> 2.0.0'
gem 'devise_invitable', '~> 1.0.0'
gem 'omniauth-facebook', '>= 1.0'
gem 'omniauth-twitter'
gem 'cancan'

gem 'jasmine', :group => [:development, :test]
gem "rspec-rails", :group => [:test, :development]
gem "nifty-generators", :group => :development
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'
gem 'gon'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
gem "mocha", :group => :test

