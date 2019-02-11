source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

#ページネーション
gem 'kaminari', '~> 0.17.0'

gem 'font-awesome-rails'

#has_secure_passwordメソッドを使用するため
gem 'bcrypt', '3.1.11'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #Rspec用のGem
  gem "rspec-rails"
  gem 'spring-commands-rspec'
  gem "factory_bot_rails"
  gem 'faker'
  gem 'capybara', '~> 2.15'
  gem "launchy"
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem "database_cleaner"
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
