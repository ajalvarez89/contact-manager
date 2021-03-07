# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{ repo }.git" }

ruby '2.7.0'

gem 'aasm'
gem 'aws-sdk'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave', '~> 2.1'
gem 'csv', '~> 3.1', '>= 3.1.9'
gem 'devise'
gem 'fog-aws', '~> 3.6', '>= 3.6.2'
gem 'font-awesome-sass', '~> 5.12.0'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.11'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'rails_12factor', group: :production
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
