source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Twitter Bootstrap for styling
gem 'bootstrap-sass', '3.1.1.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# AWS-SDK allows us to retrieve, upload, and modify files on S3
gem 'aws-sdk', '1.44.0'

# Paperclip handles file attachments and file processing intelligently
gem 'paperclip', '4.1.1'

# Paperclip-ffmpeg gives us the ability to create a poster from video content
gem 'paperclip-ffmpeg', '1.2.0'

group :development do
    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'

    # Better Errors provides us with a full interactive stack trace
    gem 'better_errors', '1.1.0'

    # Binding of Caller lets us inspect local and instance variables from within the Better Errors page
    gem 'binding_of_caller', '0.7.2'

    # Meta Request gives us a handy Rails panel in Chrome
    gem 'meta_request', '0.3.0'
end

group :development, :test do
    # RSpec gives a good testing framework
    gem 'rspec-rails', '2.99'

    # Rspec collection matchers simplify model validation testing syntax
    gem 'rspec-collection_matchers', '1.0.0'

    # FactoryGirl makes creating stubs, test models, etc. easier
    gem 'factory_girl_rails', '4.4.1'

    # Guard makes automated testing easier
    gem 'guard-rspec', '4.2.10'

    # Faker makes fake data generation easier
    gem 'faker', '1.3.0'

    # SQLite3 is convenient to use as the ActiveRecord db in development and testing
    gem 'sqlite3'
end

group :test do
    # Capybara simplifies integration testing
    gem 'capybara', '2.3.0'

    # Database Cleaner cleans up the db after tests
    gem 'database_cleaner', '1.3.0'

    # Launchy makes it easier to view web results of integration tests

    # Selenium-Webdriver makes the selenium test driver available
    gem 'selenium-webdriver'

end

group :production do
    # Error monitoring service
    gem 'rollbar', '0.12.20'

    # Application monitoring service
    gem 'newrelic_rpm', '3.8.1.221'

    # Postgresql is used on Heroku
    gem 'pg'

    # Unicorn is a Rack HTTP Server that makes scaling easier


    # Rails 12 Factor application plugin alters config to work on Heroku among other things. Read more: http://12factor.net
    gem 'rails_12factor'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

