class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre, :user_id

  has_many :subscriptions
  belongs_to :user
end
