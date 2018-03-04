source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
gem 'rails', '~> 5.1.5' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '>= 0.18' # Use postgresql as the database for Active Record
gem 'puma', '>= 3.7' # Use Puma as the app server
gem 'sass-rails', '>= 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'carrierwave'


gem 'jbuilder', '>= 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'fog-aws'
  gem 'kaminari'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  gem 'rails_layout'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'pry-rails', group: [:development, :test]
gem 'jquery-rails'
gem 'rspec-rails', group: [:development, :test]
gem 'capybara', group: [:development, :test]
gem 'launchy', group: [:development, :test]
gem 'factory_bot_rails', group: [:development, :test]
gem 'valid_attribute', group: [:development, :test]
gem 'shoulda-matchers', group: [:development, :test], require: false
gem 'dotenv-rails', groups: [:development, :test]
gem 'devise'
gem 'foundation-rails', '~> 5.0'
gem 'webpacker'
gem 'faker'
