class User < ApplicationRecord


  #Validations
  validates :name, presence: true
  validates :name, length: { in: 2..100}

  #Relationship
  has_many :posts, dependent: :destroy


  #before
  #before_validation :load_uuid


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


end