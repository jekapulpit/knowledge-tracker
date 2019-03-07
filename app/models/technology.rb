class Technology < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  self.per_page = 10

  has_many :tests, dependent: :destroy
  has_many :technologies_users, dependent: :destroy
  has_many :users, through: :technologies_users
  belongs_to :category, required: false
  has_many :marks, dependent: :destroy
  has_one_attached :icon, dependent: :destroy

  def all_attributes
    attributes
      .merge(icon_url: image_url,
             average_mark: average_mark || 'no votes')
  end

  def image_url
    if icon.attached?
      ActionController::Base.helpers.image_url(icon)
    else
      ActionController::Base.helpers.image_url('no-photo.jpg')
    end
  end
end
