class Bookmark < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :park, optional: true
  validates :user_id, uniqueness: { scope: :park_id }
 
end
