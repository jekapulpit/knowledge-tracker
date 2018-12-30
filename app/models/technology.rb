class Technology < ApplicationRecord
  has_many :tests
  has_many :users, through: :technologies_users
  has_one_attached :icon

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
