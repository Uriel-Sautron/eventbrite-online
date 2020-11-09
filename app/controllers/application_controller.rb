class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def check_if_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
