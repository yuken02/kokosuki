class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @clips = Clip.where(user_id: @user.id).includes(:channel, :favorites)
    @playlist = Playlist.where(user_id: @user.id).includes(:user, :playlist_video)

        # case params[:template]
        #   when 'clips_list'
        #     @template = 'clips_list'
        #   when 'user'
        #     @template = 'user'
        #   when 'playlist'
        #     @template = 'playlist'
        #   else
        #     @template = 'clips_list'
        # end
        case params[:template]
          when 'clips_list'
          @template = 'user/users/clips_list'
          when 'user'
          @template = 'user/users/user'
          when 'playlist'
          @template = 'user/users/playlist'
          else
          @template = 'user/users/clips_list'
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
