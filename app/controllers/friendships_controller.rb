class FriendshipsController < ApplicationController 
    def new
      @friend=User.find(params[:id])
    end
    
    def create 
      @friendship.request(curren_user.id, @friend.id)
      # if @friendship.save 
      #   redirect to:  users_path, notice: 'Friendship request was sent'
      # else
      #   redirect to:  users_path, notice: 'Friendship request failed'
      # end
    end

    def destroy
    end
end
