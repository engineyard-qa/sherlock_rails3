class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :queue
      t.integer :duration
      t.datetime :enqueued_at
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
