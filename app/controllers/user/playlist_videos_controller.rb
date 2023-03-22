class User::PlaylistVideosController < ApplicationController

  def create
    # add_playlist = Playlist_video.find(params[:playlist_id][:clip_id])
    add_playlist = Playlist_video.new(playlist_id: params[:playlist_id], clip_id: params[:clip_id])
    # add_to_playlist =
    if add_playlist.save
      redirect_to request.referer, notice: "プレイリストに追加しました"
    end
  end

  def destroy

  end
end
