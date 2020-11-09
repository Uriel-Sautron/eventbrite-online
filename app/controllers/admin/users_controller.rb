class Admin::UsersController < ApplicationController
  before_action :check_if_admin
  
  def index
    @users = User.all
   
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Utilisateur modifié!"
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to admin_users_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :is_admin)
  end
end
