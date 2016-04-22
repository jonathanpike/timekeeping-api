class Timecard < ActiveRecord::Base
  has_many :time_entries, dependent: :destroy
    
  validates :occurrence, presence: true
  validates :username, presence: true
  
  def exception? 
    update_attribute(:exception, true) if time_entries.count == 1
    update_attribute(:exception, false) if time_entries.count == 2
  end 
    
  def calculate_worked_hours
    return if exception
    time = ((TimeEntry.last.time - TimeEntry.first.time) * 24)
    update_attribute(:total_worked_hours, time)
  end 
end
