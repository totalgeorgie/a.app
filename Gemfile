source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'
gem 'bootstrap-sass', '2.3.2.0'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

gem 'carrierwave' # for resume upload http://railscasts.com/episodes/253-carrierwave-file-uploads
gem "nested_form" # added to assets pipeline

gem 'roo' # for importing old users http://railscasts.com/episodes/396-importing-csv-and-excel

gem 'sunspot_rails' # one field search -- http://railscasts.com/episodes/278-search-with-sunspot

gem 'best_in_place', github: "stopachka/best_in_place" # For cool profile edit http://railscasts.com/episodes/302-in-place-editing

# for advanced search, try http://railscasts.com/episodes/111-advanced-search-form-revised  // very cool way to filter

gem 'annotate', '2.5.0', group: :development



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

# Use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

#!!On Admin page, make them easy to associate to jobs!!! based on key words 
#!![2013-12-15 2:37:20 PM] Abraham Sorock: let's just take it down temporarily
#!![2013-12-15 2:37:21 PM] Abraham Sorock: http://www.atlas-china.com/plans-and-pricing/
#!![2013-12-15 2:29:47 PM] Stepan Parunashvili: -resume attachment work
#!![2013-12-15 2:29:54 PM] Stepan Parunashvili: - Industries and Pref city works
#!![2013-12-15 2:30:00 PM] Stepan Parunashvili: Common app sign up validates


# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
