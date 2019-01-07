class Technology < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  self.per_page = 10

  has_many :tests, dependent: :destroy
  has_many :technologies_users, dependent: :destroy
  has_many :users, through: :technologies_users
  belongs_to :category
  has_and_belongs_to_many :marks, dependent: :destroy
  has_one_attached :icon, dependent: :destroy
end
