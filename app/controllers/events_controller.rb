class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def create

    @event = Event.create(event_params)
    @event.event_admin_id = current_user.id
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end



  private

  def event_params
    event_params = params.require(:event).permit(:start_date, :title, :duration, :description, :price, :location)
  end

end
