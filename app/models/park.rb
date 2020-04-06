class Park < ApplicationRecord
   has_many :shops, dependent: :destroy
     reverse_geocoded_by :latitude, :longitude
    after_validation :geocode
   mount_uploader :park_image, PictureUploader
    default_scope -> { order(created_at: :desc) }
      geocoded_by :park_address
  after_validation :geocode
    
 def shop_list
 Shop.where("park_id = ?", id)
 end
 
   def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['park_title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
end
