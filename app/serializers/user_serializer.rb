class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :password_digest, :created_at, :updated_at

  has_many :playlists
end
