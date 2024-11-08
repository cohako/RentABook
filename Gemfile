source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'danger'
  gem 'danger-brakeman'
  gem 'danger-rubocop'
  gem 'danger-rubyc'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1', '>= 3.1.1'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'rubocop'
  gem 'rubocop-factory_bot'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-rspec_rails'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.12.0'
end

group :development do
  gem 'web-console'
end
