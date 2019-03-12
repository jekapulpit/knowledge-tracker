class User < ApplicationRecord
  ratyrate_rater
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         :confirmable,
         omniauth_providers: [:facebook]

  has_one_attached :avatar
  has_many :marks
  has_many :technologies_users
  has_many :technologies, through: :technologies_users
  has_many :test_results
  has_many :tests, through: :test_results

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
