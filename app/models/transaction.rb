class Transaction < ActiveRecord::Base
  attr_accessible :command, :output
end
