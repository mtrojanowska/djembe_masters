# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails'
gem 'devise'
gem 'mini_magick'
gem 'pundit'
gem 'kaminari'


group :development, :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop', require: false
end

group :development do
  gem 'bullet'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
