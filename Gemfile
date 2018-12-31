source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2'

gem 'pg'

gem 'puma', '~> 3.7'

gem 'sass-rails'

gem 'uglifier', '>= 1.3.0'

gem 'omniauth'

gem 'omniauth-facebook'

gem 'omniauth-twitter'

gem 'omniauth-linkedin'

gem 'omniauth-instagram'

gem 'devise'

gem 'omniauth-vkontakte'

gem 'simple_form'

gem 'will_paginate', '~> 3.1.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'elasticsearch'

gem 'elasticsearch-model'

gem 'elasticsearch-rails'

gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'

  gem 'rubocop', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
