class Task < ActiveRecord::Base
  attr_accessible :duration, :enqueued_at, :finished_at, :queue, :started_at
end
