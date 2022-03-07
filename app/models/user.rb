class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :photos
  validates :name, presence: true
  validates :email, presence: true
  validates :description, presence: true
  has_one_attached :avatar

  def avatar_url
    return unless avatar.attached?
    return avatar.service_url unless Rails.env.development? || Rails.env.test?

    rails_blob_path(avatar, only_path: true)
  end
end
