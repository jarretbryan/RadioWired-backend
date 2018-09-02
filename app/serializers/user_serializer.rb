class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :profile_image, :password_digest, :created_at, :updated_at

  has_many :playlists
end
