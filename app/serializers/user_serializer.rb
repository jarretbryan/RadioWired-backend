class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :updated_at

  has_many :playlists
end
