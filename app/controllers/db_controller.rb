class DbController < ApplicationController
  def process_list
    @results = ActiveRecord::Base.connection.execute('show processlist')
  end
  
  def all
    
    begin
      @mongo = Mongo::MongoClient.new('localhost', 27017)
    rescue
      @mongo = false
    end
    
    begin
      @memcached = Dalli::Client.new('localhost:11211')
      @memcached.set('test','1123423')
    rescue
      @memcached = false
    end
    
    
    @redis = Redis.new
    @riak = Riak::Client.new
    
  end
end
