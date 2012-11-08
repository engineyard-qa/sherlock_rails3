class DbController < ApplicationController
  def process_list
    @results = ActiveRecord::Base.connection.execute('show processlist')
  end
end
