class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.date :occurrence
      t.string :username
      t.decimal :total_worked_hours
      t.boolean :exception
      t.timestamps null: false
    end
  end
end
