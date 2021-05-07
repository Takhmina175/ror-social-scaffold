class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships
  
  has_many :friends, -> { where(friendships: { status: "accepted"}).order("name") }, through: :friendships
  has_many :requested_friends, -> { where(friendships: { status: "requested"}).order(created_at: :asc)}, through: :friendships, source: :friend
  has_many :pending_friends, -> { where(friendships: { status: "pending"}).order(created_at: :asc)}, through: :friendships, source: :friend


  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def add_gravatar(user)
    user.gravatar_url=user_gravatar(user).gravatar_url
  end

end
