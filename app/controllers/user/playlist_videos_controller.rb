class User::PlaylistVideosController < ApplicationController

  def create
    playlist = Playlist_video.find(params[:playlist_id])
    add_to_playlist =
  end

  def destroy

  end
end
