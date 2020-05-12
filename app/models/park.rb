class Park < ApplicationRecord
   geocoded_by :park_address
   after_validation :geocode
   belongs_to :user,optional: true
   has_many :bookmarks, dependent: :destroy
   has_many :shops, dependent: :destroy
   mount_uploader :park_image, PictureUploader
   default_scope -> { order(created_at: :desc) }
  scope :recent, -> {order(created_at: :desc)}
  
    
  def bookmark_by?(user)
    bookmarks.find_by(user_id: user.id).exists?
   end
   
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
