require 'chronic_duration'

class TrafficController < ApplicationController
  def long_running_action

    if request.post?
      @duration = ChronicDuration.parse(params[:duration], :keep_zero => true)
      sleep @duration.to_i
      @msg = "Last action took approximately #{ChronicDuration.output(@duration, :keep_zero => true, :format => :long)}"
    else
      @msg = nil
    end
  end
end
