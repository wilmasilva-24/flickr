class VisualizationMailer < ApplicationMailer
  default from: 'wilminhasilva@gmail.com'

  def notify_visualization
    @photo = params[:photo]
    @total = @photo.visualizations.count

    mail(to: @photo.user.email, subject: "Sua foto atingiu #{@total} visualizações.")
  end
end
