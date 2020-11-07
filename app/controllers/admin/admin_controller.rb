class Admin::AdminController < ApplicationController
  def show
    @event = Event.all
  end
end
