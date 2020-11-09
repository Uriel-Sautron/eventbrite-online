class Admin::EventSubmissionsController < ApplicationController
  before_action :check_if_admin
  
  def index
    @events = Event.where(validated: nil)
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def update
    if params[:commit] == 'Validé'
      is_validated = true 
      flash[:success] = "Evènement validé"
    elsif params[:commit] == 'Rejeté'
      is_validated = false
      flash[:error] = "Evènement rejeté"
    end
    @event = Event.find(params[:id])
    if @event.update(validated: is_validated)
      
      redirect_to admin_event_submissions_path
    else
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:commit)
  end


end
