source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"
gem "rails", "~> 5.2.3"
gem "mysql2"
gem "puma", "~> 3.12"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "devise"
gem "bootstrap", "~> 4.3.1"
gem "jquery-rails"
gem "rails-i18n"
gem "font-awesome-rails"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "figaro"
gem "config"
gem "kaminari"
gem "ransack"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "ffaker"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "shoulda-matchers", "~> 3.0", require: false
  gem "database_cleaner", "~> 1.5"
  gem "rails-controller-testing"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
