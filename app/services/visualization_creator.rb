class VisualizationCreator
  def initialize(photo)
    @photo = photo
  end

  def call
    create_visualization
    notify_post_creator

    @photo
  end
  private

  def notify_post_creator
    if @photo.visualizations.count == 100 || @photo.visualizations.count == 200
      VisualizationMailer.with(photo: @photo).notify_visualization.deliver_now
    end
  end

  def create_visualization
    @photo.visualizations.create
  end
end