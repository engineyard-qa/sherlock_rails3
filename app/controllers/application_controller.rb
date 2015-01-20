class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_app_name

  def set_app_name
    @app_name = ENV['PWD'].match(/\/data\/([^\/]*)\/current|.*\/([^\/]*)/)[1..2].compact.first
  end
end
