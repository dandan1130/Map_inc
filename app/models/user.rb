class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    has_many :parks, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :bookmark_parks, through: :bookmarks, source: :park
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 60},
                        format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :address, presence: true, length: {maximum: 255}
    validates :phone_number, presence: true, length: {maximum: 255}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true
    
 
   
   def own_park?(park)
     self.id == park.user_id
   end
    
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end

  # ランダムなトークンを返す
   def User.new_token
    SecureRandom.urlsafe_base64
   end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
end