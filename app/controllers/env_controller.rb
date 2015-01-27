class EnvController < ApplicationController
  def vars
    @env_hash = Hash[*(ENV.to_a.flatten)]
  end

  def request_info
    @req_info = request.instance_variable_get(:@env)
  end
end
