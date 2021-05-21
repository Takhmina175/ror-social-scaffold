require 'rails_helper'
RSpec.describe Friendship, type: :model do
  before(:each) do
    @user = User.create!(name: 'user', email: 'user@m', password: '123456', password_confirmation: '123456')
    @friend = User.create!(name: 'friend', email: 'friend@m', password: '123456', password_confirmation: '123456')
  end
  # let(:new){Friendship.new}
  let(:request) { Friendship.request(@user, @friend) }
  let(:accept) { Friendship.accept(@user, @friend) }
  let(:breakup) { Friendship.breakup(@user, @friend) }

  describe 'validations' do
    it 'is valid with user_id and friend_id' do
      @friendship = Friendship.new
      @friendship.user_id = @user.id
      @friendship.friend_id = @friend.id
      @friendship.validate
      expect(@friendship).to be_valid
    end
    it 'is not valid without friend_id' do
      @friendship = Friendship.new
      @friendship.user_id = @user.id
      @friendship.friend_id = nil
      @friendship.validate
      expect(@friendship).to_not be_valid
    end

    it 'is not valid without user_id' do
      @friendship = Friendship.new
      @friendship.user_id = nil
      @friendship.friend_id = @friend.id
      @friendship.validate
      expect(@friendship).to_not be_valid
    end
  end

  describe 'Friendship Create' do
    it 'has 1 requested and 1 pending friendship' do
      request
      expect(@user.requested_friends.count).to eq(1)
      expect(@friend.pending_friends.count).to eq(1)
    end
  end

  describe 'Friendship Accept' do
    it 'has 1 accepted friendship after friend accept the frienship' do
      request
      accept
      expect(@user.friends.count).to eq(1)
      expect(@friend.friends.count).to eq(1)
    end
  end

  describe 'Friendship Breakup' do
    it 'has no friendships with the user after breaking up the friendship' do
      request
      accept
      breakup
      expect(@user.friendships.count).to eq(0)
      expect(@friend.friendships.count).to eq(0)
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
