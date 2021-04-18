source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.2', '>= 6.1.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Devise
gem 'devise'
gem 'devise-token_authenticatable'

# continuous integration
gem 'rubocop', '0.58.2'
gem 'pre-commit', '0.39.0'
gem 'pronto', '0.11.0'
gem 'pronto-rubocop', '0.11.0'

# Graphql
gem 'graphql', '1.12.3'
gem 'graphql-pagination', '1.1.2'
gem 'kaminari-activerecord', '1.2.1'

# Graphl Upload files
gem 'apollo_upload_server', '2.0.3'

# graphql utilities
gem 'graphlient', '0.5.0'

# cors requests
gem 'rack-cors', '1.0.5'

# CDN image processing on-demand
gem 'imgix', '3.3.1'

# pdf
gem 'wicked_pdf', '2.1.0'
gem 'wkhtmltopdf-binary', '0.12.6.5'
gem 'pdf-reader', '2.4.2'

# background jobs
gem 'whenever', '0.9.7'

# image
gem 'active_storage_validations', '0.9.2'
gem 'graphiql-rails', group: :development
