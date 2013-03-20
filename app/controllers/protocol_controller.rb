class ProtocolController < ApplicationController

  
  def detect
    @schema = request.ssl? ? 'HTTPS' : 'HTTP'
  end

  def force_ssl
  end
end
