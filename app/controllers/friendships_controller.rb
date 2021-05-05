class FriendshipsController < ApplicationController 
def new
  @friend=User.friend(params[:id])
end

def create 
  Friendship.request(curren_user.id, @friend.id) 
  flash[:notice] = "Friend request sent."
  redirect_to profile_page_path(@friend)
end 

def accept 
  if @user.requested_friends.include?(@friend)
    Friendship.accept(@user, @friend)
    flash[:notice] = "Friendship with #{@friend.name} accepted!"
  else
    flash[:notice] = "No friendship request from #{@friend.name}."
  end
redirect_to root_path
end 

def delete 
  if @user.requested_friends.include?(@friend)
  Friendship.breakup(@user, @friend)
  flash[:notice] = "Friendship with #{@friend.name} deleted!"
  else
    flash[:notice] = "You are not friends with #{@friend.name}."
  end
redirect_to root_path
end 
end
