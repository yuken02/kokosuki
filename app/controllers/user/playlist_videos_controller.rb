class User::PlaylistVideosController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_playlist_video, only: [:destroy]

  def create
    @playlist_ids = params[:playlist_ids]
    if save_to_playlist
      redirect_to request.referer, notice: "プレイリストに追加しました。"
    else
      redirect_to request.referer, alert: "プレイリストに追加できませんでしました。"
    end
  end

  def destroy
    # playlist_video = PlaylistVideo.find(params[:id])
    # playlist_video = PlaylistVideo.includes(:playlist).find_by(clip_id: params[:clip_id], playlist_id: params[:playlist_id])
    playlist_video = PlaylistVideo.find(params[:id])
    unless playlist_video
      redirect_to request.referer, alert: 'プレイリストのクリップが見つかりません'
    end
    if playlist_video.playlist.user == current_user
      playlist_video.destroy
      redirect_to request.referer, notice: "プレイリストから削除しました。"
    else
      redirect_to request.referer, alert: '権限がありません'
    end
  end


  private

  def save_to_playlist
    @playlist_ids.each do |playlistId|
      add_to_playlist = PlaylistVideo.new(clip_id: params[:clip_id], playlist_id: playlistId)
      add_to_playlist.save
    end
  end

  # def set_playlist_video
  #   @playlist_video = PlaylistVideo.find_by(clip_id: params[:clip_id], playlist_id: params[:playlist_id])
  #   unless @playlist_video
  #     redirect_to request.referer, alert: 'プレイリストのクリップが見つかりません'
  #   end
  # end
end
