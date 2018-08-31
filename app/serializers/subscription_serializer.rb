class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :website, :publisher, :title, :country, :image, :rss, :language, :thumbnail, :description, :ep_id

  belongs_to :playlist
end
