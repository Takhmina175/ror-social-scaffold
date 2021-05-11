class FriendshipsController < ApplicationController
  before_action :setup_friend

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = 'Friend request sent.'
    redirect_to users_path
  end

  def update
    if @user.pending_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to root_path
  end

  def destroy
    if Friendship.find_by_user_id_and_friend_id(@user, @friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} deleted!"
    else
      flash[:notice] = "You are not friends with #{@friend.name}."
    end
    redirect_to root_path
  end

  def setup_friend
    @user = current_user
    @friend = User.find(params[:id])
  end
end
