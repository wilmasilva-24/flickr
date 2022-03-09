class Photos::Show::CommentsSerializer < ActiveModel::Serializer
  attributes :id, :title, :message

  belongs_to :photo, serializer: Photos::Show::PhotoSerializer
  belongs_to :user, serializer: Photos::Show::UserSerializer
end