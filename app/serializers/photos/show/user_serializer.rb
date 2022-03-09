class Photos::Show::UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :description, :avatar, :join_date

  def avatar
    object.avatar_url
  end
  
  def join_date
    object.created_at
  end
end