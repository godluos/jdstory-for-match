class Product < ApplicationRecord
  belongs_to :category
  has_many :posts
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user
  mount_uploader :image, ImageUploader


  scope :recent, -> { order('created_at DESC') }
  scope :random6, -> { limit(6).order("RANDOM()") }
  scope :random12, -> { limit(12).order("RANDOM()") }
end
