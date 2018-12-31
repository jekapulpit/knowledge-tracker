class Technology < ApplicationRecord
  has_many :tests
  has_many :technologies_users
  has_many :users, through: :technologies_users
  has_one_attached :icon

  self.per_page = 10

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
