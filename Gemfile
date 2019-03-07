source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg'
gem 'rails', '~> 5.2.2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'figaro'
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'react-rails'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-instagram'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'
gem 'pundit'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'will_paginate', '~> 3.1.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'elasticsearch'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  gem 'rubocop', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
