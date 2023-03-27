class User::HomesController < ApplicationController
  def top
  end

  def show
    @user = current_user
    @clips = current_user.clip
    @playlist_new = current_user.playlist.new
    # @playlists = current_user.playlists.includes(:playlist_videos)
    @playlists = current_user.playlist.includes(playlist_video: [:clip])
    # @user = User.includes(:clips, playlist: [:playlist_video]).find(current_user.id)
    # @user = User.includes(:clip, playlist: [:playlist_video]).find(current_user.id)
    # @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    # @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    # @playlist = Playlist.includes(:user, playlist_video: [:clip]).find(current_user.id)


    # case params[:template]
    #   when 'clips_list'
    #   @template = 'user/users/clips_list'
    #   @user = User.find(params[:id])
    #   @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    #   @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    #   when 'user', nil
    #   @template = 'user/users/user'
    #   @user = User.find(params[:id])
    #   @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    #   @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    #   when 'playlist'
    #   @template = 'user/playlists/playlist'
    #   else
    #   @template = 'user/users/clips_list'
    #   @user = User.find(params[:id])
    #   @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    #   @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    # end
    # respond_to do |format|
    #   format.html
    #   format.js { render 'switch.js.erb' }
    # end
  end
end
