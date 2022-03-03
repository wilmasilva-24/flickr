class UsersController < ApplicationController
  def show
    user = User.find(params[:id])

    render json: user, status: 200, serializer: Users::Show::UserSerializer

  end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :description, :avatar)
  # end
end