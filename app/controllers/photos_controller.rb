class PhotosController < ApplicationController
  def index
    photos = Photo.all

    if params[:user_id].present?
      photos = photos.where(user_id: params[:user_id])

    elsif params[:start_date].present? && params[:end_date].present?
      photos = photos.where("date(photos.created_at) between :start_date and :end_date", 
                            start_date: params[:start_date], end_date: params[:end_date])
    end
  
    render json: photos, status: :ok, each_serializer: Photos::Index::PhotoSerializer
  end

  def show
    photo = VisualizationCreator.new(
      Photo.find(params[:id])
    ).call

    render json: photo, status: :ok, serializer: Photos::Show::PhotoSerializer
  end

  def create
    user = User.find(photo_params[:user_id])
    
    if user.active?
      photo = Photo.new(photo_params)
      photo.save
      render json: photo, status: :created, serializer: Photos::Create::PhotoSerializer
    else
      render json:  {message: 'O usuaŕio não está ativo'}, status: 422
    end
  end

  def comments
    comments = Photo.includes(comments: :user).find(params[:id]).comments
    
    render json: comments, status: :ok, each_serializer: Photos::Show::CommentsSerializer
  end
  
  private
  def photo_params
    params.require(:photo).permit(:image, :user_id)
  end
end