class UsersController < ApplicationController
  def show
    user = User.find(params[:id])

    render json: user, status: 200

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :description)
  end
end