class User::PlaylistsController < ApplicationController

  def create
    @playlist_new = Playlist.new(playlist_params)
    @playlist_new.user_id = current_user.id
    if @playlist_new.save
      redirect_to request.referer, alert: "新しいプレイリストを作成しました。"
    else
      render 'user/clips/add_to_playlist'
    end
  end

  def update

  end

  def destroy
    playlist = Playlist.new(params[:id])
    playlist.destroys
  end


  private

  def playlist_params
    params.require(:playlists).permit(:name)
  end
end
