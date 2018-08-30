class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre

  has_many :subscriptions
  belongs_to :user
end
