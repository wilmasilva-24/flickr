class PhotosController < ApplicationController
  def index
    photo = Photo.where(user_id: params[:user_id])
    
    render json: photo, status: :ok, each_serializer: Photos::Index::PhotoSerializer
  end

  def show
    photo = Photo.find(params[:id])
    photo.visualizations.create
    
    if photo.visualizations.count == 100
      VisualizationMailer.with(photo: photo).notify_visualization.deliver_now

    elsif
      photo.visualizations.count == 200
      VisualizationMailer.with(photo: photo).notify_visualization.deliver_now
    end

    render json: photo, status: :ok, serializer: Photos::Show::PhotoSerializer
  end

  def create
    photo = Photo.create(photo_params)

    render json: photo, status: :created, serializer: Photos::Create::PhotoSerializer
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

#quando atingir 100 visualizações enviar email dizendo que a postagem atigiu 100
# Quando atingir 200 visualizações