require 'uploads'

class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :vendor
  has_many :order_items
  has_one_attached :image

  validates :name, presence: true

  default_scope { where(active: true) }

  def image_header_variant
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_limit(width: 500, height: -1, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

end
