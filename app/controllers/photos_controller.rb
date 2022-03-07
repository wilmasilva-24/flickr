class PhotosController < ApplicationController
  def index
    photo = Photo.where(user_id: params[:user_id])
    
    render json: photo, status: :ok, each_serializer: Photos::Index::PhotoSerializer
  end

  def show
    photo = Photo.find(params[:id])
        
    render json: photo, status: :ok, serializer: Photos::Show::PhotoSerializer
  end

  def create
    photo = Photo.create(photo_params)

    render json: photo, status: :created, serializer: Photos::Create::PhotoSerializer
  end
  
  private
  def photo_params
    params.require(:photo).permit(:image, :user_id)
  end
end