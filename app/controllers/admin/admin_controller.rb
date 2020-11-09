class Admin::AdminController < ApplicationController
  before_action :check_if_admin
  
  def show
    @event = Event.all
  end
end
