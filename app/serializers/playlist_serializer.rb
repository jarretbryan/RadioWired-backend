class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre, :user_id, :created_at

  has_many :subscriptions
  belongs_to :user
end
