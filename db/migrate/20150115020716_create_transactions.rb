class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :command
      t.text :output

      t.timestamps
    end
  end
end
