class UsersController < ApplicationController
  before_action :authenticate_user
  def show
    user = User.find(params[:id])
    if user == current_user
      render json: User.find(params[:id])
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
