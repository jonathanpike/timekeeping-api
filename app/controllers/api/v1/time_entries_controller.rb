class Api::V1::TimeEntriesController < ApplicationController
  def index
    entries = TimeEntry.all
    render json: { total: entries.count,
			             timeentries: entries	}
  end 
  
  def create 
    entry = TimeEntry.create(timeentry_params)
    if entry.valid?
      card = Timecard.find(entry.timecard_id)
      card.exception? 
      card.calculate_worked_hours if card.exception == false 
      render json: entry, status: :created
    else 	
      render json: entry.errors, 
			       status: :unprocessable_entity
    end 
  end 
  
  def update
    entry = TimeEntry.find(params[:id])
    if entry.update_attributes(timeentry_params)
      card = Timecard.find(entry.timecard_id)
      card.exception? 
      card.calculate_worked_hours if card.exception == false 
      render json: entry, status: :ok
    else 
      render json: entry.errors, 
			       status: :unprocessable_entity
    end
  end 
  
  def destroy
    entry = TimeEntry.find(params[:id])
    if entry.destroy
      render json: {}, status: :ok
    else 
      render json: {error: "Time Entry could not be deleted."}, status: :unprocessable_entity
    end 
  end 
  
  private 
  
  def timeentry_params
    params.require(:time_entry).permit(:time, :timecard_id)
  end 
end
