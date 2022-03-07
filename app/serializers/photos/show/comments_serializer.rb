class Photos::Show::CommentsSerializer < ActiveModel::Serializer
  attributes :id, :title, :message

  belongs_to :photo, serializer: Photos::Show::PhotoSerializer
end