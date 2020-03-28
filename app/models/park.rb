class Park < ApplicationRecord
   has_many :shops, dependent: :destroy
   mount_uploader :park_image, PictureUploader
    default_scope -> { order(created_at: :desc) }
    
end
