class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  validates_presence_of :user_id, :friend_id

  # return true if the users are (possibly pending) friends
  def self.exists?(user, friend)
    !find_by_user_id_and_friend_id(user, friend).nil?
  end

  # Record a pending friend request
  def self.request(user, friend)
    return if user == friend or Friendship.exists?(user, friend)

    transaction do
      create(user: user, friend: friend, status: 'requested')
      create(user: friend, friend: user, status: 'pending')
    end
  end

  # Accept a friend request.
  def self.accept(user, friend)
    transaction do
      accept_one_side(user, friend)
      accept_one_side(friend, user)
    end
  end

  # delete a friendship or cancel a pending request.
  def self.breakup(user, friend)
    transaction do
      Friendship.find_by_user_id_and_friend_id(user, friend).destroy
      Friendship.find_by_user_id_and_friend_id(friend, user).destroy
    end
  end

  def self.accept_one_side(user, friend)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.save!
  end
end
