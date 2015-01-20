class ApplicationController < ActionController::Base
  protect_from_forgery

  @app_name = ENV['PWD'].match(/\/data\/([^\/]*)\/current|.*\/([^\/]*)/)[1..2].compact.first
end
