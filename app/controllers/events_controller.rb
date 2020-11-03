class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.create(eventparams)
    @event.user_id current_user.id
  end



  private

  def eventparams
    params.permit[:start_date, :duration, :title, :description, :price, :location]
  end

end
