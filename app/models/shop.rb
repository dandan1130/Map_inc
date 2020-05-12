class Shop < ApplicationRecord
  include ActiveModel:: Model
    attr_accessor :shop_search
    belongs_to :park,optional: true
    mount_uploader :shop_image, PictureUploader
    scope :recent, -> { order(created_at: :desc) }
    
    def self.search(search)
    park = Park.find(search[:park_id])
    result = park.shops.where('floor LIKE ?', "%#{search[:shop_search]}%")
    .or(park.shops.where('category LIKE ?', "%#{search[:shop_search]}%"))
    .or(park.shops.where('shop_name LIKE ?', "%#{search[:shop_search]}%"))
    result
    end
end   