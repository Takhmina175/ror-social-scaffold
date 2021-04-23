class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User" 
 
   scope :pending, -> { where('status == 0') }
   scope :accepted, -> { where('status == 1') }
   scope :rejected, -> { where('status == 2') }
validates :user_id, uniqueness: {scope: :friend_id}
end
