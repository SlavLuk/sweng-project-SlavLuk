source 'https://rubygems.org'

ruby '2.6.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
gem 'haml'




# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'simplecov', :require => false
  gem 'sqlite3', '1.3.11'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'ZenTest', '4.11.2'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
end

group :production do
  #gem 'pg', '~> 0.21' # for Heroku deployment
  # gem 'rails_12factor'
end
