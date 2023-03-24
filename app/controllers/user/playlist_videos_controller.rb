class User::PlaylistVideosController < ApplicationController

  def create
    @playlist_ids = params[:playlist_ids]
    if save_to_playlist
      redirect_to request.referer, notice: "プレイリストに追加しました。"
    else
      redirect_to request.referer, alert: "プレイリストに追加できませんでしました。"
    end
  end

  def destroy

  end


  private

  def save_to_playlist
    @playlist_ids.each do |playlistId|
      add_to_playlist = PlaylistVideo.new(clip_id: params[:clip_id], playlist_id: playlistId)
      add_to_playlist.save
    end
  end
end
