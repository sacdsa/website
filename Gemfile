source 'https://rubygems.org'
ruby File.read('.ruby-version')

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 2.0.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rack-slashenforce'
gem 'devise'
gem 'activeadmin'
gem 'activeadmin_settings_cached'
gem 'acts_as_list'
gem 'activeadmin_sortable_table'
gem 'autoprefixer-rails'
gem 'nationbuilder-rb', require: 'nationbuilder'
gem 'simple_calendar', '~> 2.0'
gem 'trix'
gem 'annotate'
gem 'aws-sdk-s3', '~> 1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'will_paginate', '~> 3.1.0'
gem 'activeadmin_quill_editor'
gem 'icalendar'
gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'seed_dump'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'rails_serve_static_assets'
  gem 'rails_12factor'
end
