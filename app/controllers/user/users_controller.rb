class User::UsersController < ApplicationController

  def show
    # @user = User.find(params[:id])
    # @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    # @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    @playlist = Playlist.includes(:user, playlist_video: [:clip]).find(params[:id])


    case params[:template]
      when 'clips_list'
      @template = 'user/users/clips_list'
      @user = User.find(params[:id])
      @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
      @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
      when 'user'
      @template = 'user/users/user'
      @user = User.find(params[:id])
      @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
      @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
      when 'playlist'
      @template = 'user/playlists/playlist'
      else
      @template = 'user/users/clips_list'
      @user = User.find(params[:id])
      @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
      @playlists = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)
    end
    respond_to do |format|
      format.html
      format.js { render 'switch.js.erb' }
    end
  end

  # def switch
  #   @template_name = params[:template_name]
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def edit

  end

  def update

  end
end
