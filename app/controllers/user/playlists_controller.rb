class User::PlaylistsController < ApplicationController

  def create
    @playlist_new = Playlist.new(playlist_params)
    @playlist_new.user_id = current_user.id
    if @playlist_new.save
      redirect_to request.referer, notice: "新しいプレイリストを作成しました。"
    else
      render 'user/users/add_to_playlist', alert: 'プレイリストの作成に失敗しました。'
    end
  end

  def update

  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.destroy
    redirect_to request.referer, notice: "プレイリストを削除しました。"
  end


  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
