class ProtocolController < ApplicationController

  
  def detect
    schema = request.ssl? ? 'HTTP' : 'HTTPS'
  end

  def force_ssl
  end
end
