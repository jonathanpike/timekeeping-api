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
    time = ((Time.parse(time_entries.last.time.to_s) - Time.parse(time_entries.first.time.to_s)) / 3600)
    update_attribute(:total_worked_hours, time)
  end 
end
