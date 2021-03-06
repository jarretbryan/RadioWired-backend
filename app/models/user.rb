class User < ApplicationRecord
    
    validates_presence_of :email, :password_digest
    validates :email, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    has_secure_password

    has_many :playlists
    has_many :favorites
    has_many :subscriptions, through: :favorites
    

end
