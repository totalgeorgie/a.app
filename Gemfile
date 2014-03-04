source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'
gem 'bootstrap-sass'

gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'carrierwave' # for resume upload http://railscasts.com/episodes/253-carrierwave-file-uploads

gem "nested_form" # added to assets pipeline

gem 'roo' # for importing old users http://railscasts.com/episodes/396-importing-csv-and-excel

gem "select2-rails" # for x-editable select2

gem 'x-editable-rails' # For cool profile edit https://github.com/tkawa/bootstrap-editable-rails

gem 'annotate', '2.5.0', group: :development

gem 'customerio', :git => 'https://github.com/customerio/customerio-ruby' #http://customer.io/docs/rails-customerio.html

# for advanced search, try http://railscasts.com/episodes/111-advanced-search-form-revised  // very cool way to filter

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

# Use SCSS for stylesheets

gem 'sass-rails', '~> 4.0.0.rc2'
gem 'slim'

# Use Uglifier as compressor for JavaScript assets

gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views

gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library

gem 'jquery-rails'
gem "jquery-ui-rails" #for bootstrap in-place styling
gem 'chosen-rails' #http://harvesthq.github.io/chosen/ https://github.com/tsechingho/chosen-rails
gem 'formtastic'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks' Removed turbolinks, because problems loading camera and common app js http://stackoverflow.com/questions/20662426/rails-not-loading-js-in-chome-from-link-to
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

gem "bootstrap-switch-rails" #to make it switchable with video

# Use ActiveModel has_secure_password

gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

#For delayed job, and making this cheap for abe, use https://github.com/meskyanichi/hirefire

# Use unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano', group: :development
# Use debugger
# gem 'debugger', group: [:development, :test]
