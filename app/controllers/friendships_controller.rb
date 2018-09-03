class FriendshipsController < ApplicationController
   
   def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    if @friendship
        @friendship.destroy
        flash[:notice] = "Friend was removed"
    else
        flash[:danger] = "Error removing friend"
    end
    redirect_to my_friends_path
   end
end