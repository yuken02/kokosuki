class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
  end

  def edit

  end

  def update

  end
end
