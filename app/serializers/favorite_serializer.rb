class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :subscription_id
  belongs_to :subscriptions
  belongs_to :users
end
