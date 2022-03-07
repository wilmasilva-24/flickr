class Photo < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_one_attached :image

  def image_url
    return unless image.attached?
    return image.service_url unless Rails.env.development? || Rails.env.test?

    rails_blob_path(image, only_path: true)
  end
end
