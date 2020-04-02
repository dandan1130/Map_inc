class Shop < ApplicationRecord
    belongs_to :park
    mount_uploader :shop_image, PictureUploader
    
end
