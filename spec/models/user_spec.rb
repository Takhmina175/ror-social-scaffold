require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(name: 'user', email: 'user@m', password: '123456', password_confirmation: '123456')
    @friend = User.create!(name: 'friend', email: 'friend@m', password: '123456', password_confirmation: '123456')
  end
  let(:request) { Friendship.request(@user, @friend) }
  let(:accept) { Friendship.accept(@user, @friend) }

  describe 'User friendship status' do
    it 'checks requested friends status' do
      request
      expect(@user.friendships.find_by_friend_id(@friend).status).to eq('requested')
      expect(@friend.friendships.find_by_friend_id(@user).status).to eq('pending')
    end
    it 'checks accepted friends status' do
      request
      accept
      expect(@user.friendships.find_by_friend_id(@friend).status).to eq('accepted')
      expect(@friend.friendships.find_by_friend_id(@user).status).to eq('accepted')
    end
  end

  describe 'Associations' do
    it { should have_many(:friendships) }
    it { should have_many(:requested_friends).through(:friendships) }
    it { should have_many(:pending_friends).through(:friendships) }
  end
end
