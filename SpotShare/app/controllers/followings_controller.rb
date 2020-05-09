class FollowingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_playlist
  before_action :set_user
  before_action :if_same_user
  
  def follow_playlist
    @playlist.users << @user unless @playlist.owner == @user.username || @playlist.users.include?(@user)
    redirect_to @user
  end
  
  def unfollow_playlist
    unless @playlist.owner == @user.username
      if @playlist.users.include?(@user)
        @playlist.users.delete(@user)
      end
    end
    redirect_to @user
  end
  
  private
  
  def set_playlist
    @playlist = playlists.find_by(id: params[:playlist_id])
  end
  
  def set_user
    @user = users.find_by(id: params[:user_id])
  end
  
  def if_same_user
    redirect_to playlists_path unless current_user == @user
  end
  
end
  