source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.1.0'

gem 'sass-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'thin'
gem 'bcrypt'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'uglifier'
end


# Use has_secure_password for authentication
gem 'bcrypt-ruby', '~> 3.1.2'

# Use carrierwave for image uploads
gem 'carrierwave'
gem 'rmagick'