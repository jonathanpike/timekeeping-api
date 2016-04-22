class Api::V1::TimecardsController < ApplicationController
  def index
    cards = Timecard.all
    render json: { total: cards.count,
			             timecards: cards	}
  end 
  
  def create
    card = Timecard.create(timecard_params)
    if card.valid?
      render json: card, status: :created
    else 	
      render json: card.errors, 
			       status: :unprocessable_entity
    end 
  end 
  
  def update
    card = Timecard.find(params[:id])
    if card.update_attributes(timecard_params)
      render json: card, status: :ok
    else 
      render json: card.errors, 
			       status: :unprocessable_entity
    end 
  end 
  
  def destroy
    card = Timecard.find(params[:id])
    if card.destroy
      render json: {}, status: :ok
    else 
      render json: {error: "Timecard could not be deleted."}, status: :unprocessable_entity
    end 
  end 
  
  private 
  
  def timecard_params
    params.require(:timecard).permit(:occurrence, :username)
  end 
end
