class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user_params = params.permit(:first_name, :last_name, :description)

    if @user.update(user_params)
      redirect_to @user, :notice => "Profil mis à jour"
    else
      render :show
    end
  end
end
