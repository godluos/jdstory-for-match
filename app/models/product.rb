class Product < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  scope :recent, -> { order('created_at DESC') }
end
