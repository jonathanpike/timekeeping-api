class TimeEntry < ActiveRecord::Base
    belongs_to :timecard
    
    validates :time, presence: true
end
