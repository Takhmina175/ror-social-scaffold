class FriendshipsController < ApplicationController 

    def create 
      @friendship = current_user.friendships.build(request.GET)
      if @friendship.save 
        redirect to:  users_path, notice: 'Friendship request was sent'
      else
        redirect to:  users_path, notice: 'Friendship request failed'
      end
    end

    def destroy
    end
end
