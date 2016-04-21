class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.datetime :time 
      t.references :timecard, index: true
      t.timestamps null: false
    end
  end
end
