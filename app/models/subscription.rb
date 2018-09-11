class Subscription < ApplicationRecord
    belongs_to :playlist
    has_many :favorites
    has_many :users, through: :favorites
end
