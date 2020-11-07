class Admin::EventSubmissionsController < ApplicationController

  def index
    @events = Event.where(validated: nil)
  end 





end
