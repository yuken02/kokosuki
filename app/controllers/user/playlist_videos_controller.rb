class User::PlaylistVideosController < ApplicationController

  def create
    # add_playlist = Playlist_video.find(params[:playlist_id][:clip_id])
    # add_playlist = PlaylistVideo.new(playlist_id: params[:playlist_id], clip_id: params[:clip_id])
    # add_to_playlist =
    # if add_playlist.save
    #   redirect_to request.referer, notice: "プレイリストに追加しました"
    # end
    # add_playlist = PlaylistVideo.new(playlist_id: params[:playlist_ids], clip_id: params[:clip_id])
    add_to_playlist = PlaylistVideo.new
    add_to_playlist.clip_id = params[:clip_id]
    playlist_ids = params[:playlist_ids]
    if playlist_ids.each do |playlist_id|
        add_to_playlist.playlist_id = playlist_id
        add_to_playlist.save
      end
    redirect_to request.referer, notice: "プレイリストに追加しました"
    end
  end

  def destroy

  end
end
