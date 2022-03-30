source 'https://rubygems.org'

# SETUP PROCFILE and PUMA
# https://devcenter.heroku.com/articles/ruby-default-web-server
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

source "https://rubygems.org"
ruby "2.5.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1'
gem 'bundler', '1.17.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Add VUE!
gem 'vuejs-rails'
gem 'rb-readline'

# Add bulma
gem "bulma-rails", "~> 0.2.3"

# Add Font awesome !
gem "font-awesome-rails"

# Use Postgres
gem 'pg', '~> 0.20'

# Use wicked PDF
gem 'wicked_pdf'

# Use pdf from html
gem 'wkhtmltopdf-binary'

# Use ECHART for cool graph
gem 'echarts-rails', '~> 0.1.6'

# Use devise authentication
gem 'devise'
gem 'omniauth-facebook'

# mailer with sendgrid
gem 'sendgrid-ruby'

# selectize
gem 'selectize-rails', '~> 0.12.4.1'

# qr code
gem 'rqrcode', '~> 0.10.1'

# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'nokogiri', '~> 1.6', '>= 1.6.8'
gem 'chart-js-rails'
gem 'chartkick'
gem 'sunspot_rails', '~> 2.2', '>= 2.2.7'
gem 'rest-client', '~> 2.1'

gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
gem 'sweet-alert2-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rb-readline'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# group :production do
#   ruby '2.2.3'
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
