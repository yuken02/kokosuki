class User::FavoritesController < ApplicationController
  def create
    clip = Clip.find(params[:clip_id])
    favorite = current_user.favorites.new(clip_id: clip.id)
    favorite.save
    @clip = Clip.includes(:user, :channel, :favorites).find_by(id: params[:clip_id])
  end

  def destroy
    # binding.irb
    clip = Clip.find(params[:clip_id])
    favorite = current_user.favorites.find_by(clip_id: clip.id)
    favorite.destroy
    @clip = Clip.includes(:user, :channel, :favorites).find_by(id: params[:clip_id])
  end
end
