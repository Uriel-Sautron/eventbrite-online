class UsersController < ApplicationController
  before_action :authenticate_user!, :user?

  def show
    @user = User.find(params[:id])
  end



  def user?
    @user = User.find(params[:id])
    if
    current_user.id == @user.id   
    else
      redirect_to root_path
    end
  end
end
