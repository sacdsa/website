source 'https://rubygems.org'
ruby File.read('.ruby-version')

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin'
gem 'activeadmin_quill_editor'
gem 'activeadmin_settings_cached'
gem 'activeadmin_sortable_table'
gem 'acts_as_list'
gem 'annotate'
gem 'autoprefixer-rails'
gem 'aws-sdk-s3', '~> 1'
gem 'devise'
gem 'dotenv-rails'
gem 'font-awesome-sass', '~> 5.6.1'
gem 'icalendar'
gem 'jbuilder', '~> 2.5'
gem 'nationbuilder-rb', require: 'nationbuilder'
gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 2.0.0'
gem 'pg'
gem 'puma'
gem 'rack-slashenforce'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'simple_calendar', '~> 2.0'
gem 'StreetAddress', require: 'street_address'
gem 'trix'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry'
  gem 'seed_dump'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end
