class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  ratyrate_rater
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         :confirmable,
         :async,
         omniauth_providers: [:facebook]

  has_one_attached :avatar
  has_many :technologies_users
  has_many :technologies, through: :technologies_users
  has_many :test_results
  has_many :tests, through: :test_results

  def with_all_attributes
    attributes.merge({
        avatarUrl: image_url,
        attempsNumber: tests.count,
        passedNumber: tests.select{|test| test.passed_by_user?(self)}.uniq.count
    })
  end

  def image_url
    if avatar.attached?
      ActionController::Base.helpers.image_url(rails_blob_path(avatar))
    else
      ActionController::Base.helpers.image_url('no-photo.jpg')
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
