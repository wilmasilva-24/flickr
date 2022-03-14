class Photos::Show::PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :visualizations

  def image_url
    object.image_url
  end
  
  def visualizations
    object.visualizations.count
  end
end