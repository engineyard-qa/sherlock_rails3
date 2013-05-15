source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'bundler', '~> 1.3.4' # Support for Ruby 2.0.0

group :development do
  gem 'sqlite3'
end

platform :ruby do
  gem 'mysql2', '~> 0.3.0'
  gem 'pg', '~> 0.13.2'
  gem 'unicorn'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  gem 'jdbc-postgres', :require => false
  gem 'trinidad'
  gem 'thor'
end

gem 'puma'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'dalli'
gem 'resque'
gem 'riak-shim'
gem 'mongo'
