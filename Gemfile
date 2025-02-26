# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'image_processing', '~> 1.2'
gem 'importmap-rails'
gem 'kamal', require: false
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.1'
gem 'thruster', require: false
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 7.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', require: false
end
