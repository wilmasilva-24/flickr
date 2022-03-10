class UsersController < ApplicationController
  def show
    user = User.includes(:photos).find(params[:id])

    render json: user, status: 200, serializer: Users::Show::UserSerializer

  end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :description, :avatar)
  # end
end