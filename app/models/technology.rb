class Technology < ApplicationRecord
  include Rails.application.routes.url_helpers
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  ratyrate_rateable "mark"
  self.per_page = 10

  has_many :tests, dependent: :destroy
  has_many :technologies_users, dependent: :destroy
  has_many :users, through: :technologies_users
  belongs_to :category, required: false
  has_one_attached :icon, dependent: :destroy

  def all_attributes
    attributes
      .merge(icon_url: image_url,
             average_mark: average_mark || 'no votes')
  end

  def image_url
    if icon.attached?
      ActionController::Base.helpers.image_url(rails_blob_path(icon))
    else
      ActionController::Base.helpers.image_url('no-photo.jpg')
    end
  end

  def update_rating
    self.average_mark = Rating::GetOperation.new(self).avg_rate
    save
  end
end
