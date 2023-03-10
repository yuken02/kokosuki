class ClipsController < ApplicationController
  def index
    @clip_new = Clip.new
    @clips = Clip.all

    # require 'google/api_client'
    require 'date'

    # @url = params[:url]
    time = params[:time]
    if time
      @seconds = time_to_second(time)
    end
    video_url = params[:url]
    if video_url
      get_video_id(video_url)
      @url = video_url
    end
  end

  def new
    @clip_new = Clip.new

  end

  def create
    video_url = params[:video_url]
    start_time = params[:start]
    end_time = params[:end]
    get_video_id(video_url)
    @clip = Clip.new(clip_params.merge(video_id: video_id, published_at: published_at, channel_id: channel_id, user_id: 1))
    if @clip.save
      redirect_to clips_path
    else
      render new_clip_path
    end
  end

  def destroy
    clip = Clip.find(param[:id])
    clip.destroy
    @clips = Clip.all
    redirect_to request.referer, notice: "クリップを削除しました"
  end


  private

  def time_to_second(time_string)
    ###
    time_hour = time_minute = time_second = 0
    if time_string.include?("h")
      time_hour = time_string.split("h").first
      if time_string.include?("m")
        time_minute = time_string.split("h").last.split("m").first
      end
      if time_string.include?("s")
        time_second = time_string.split("h").last.split("m").last.delete("s")
      end
    elsif time_string.include?("m")
      time_minute = time_string.split("m").first
      if time_string.include?("s")
        time_second = time_string.split("m").last.delete("s")
      end
    elsif time_string.include?("s")
      time_second = time_string.delete("s")
    end
    (time_hour.to_i * 60 * 60) + (time_minute.to_i * 60) + time_second.to_i
    ### chatGPT 1
    # @seconds = ActiveSupport::Duration.parse(time_string).to_i
    ### chatGPT 2
    # hours, minutes, seconds = time_string.split(/[hm]/).map(&:to_i)
    # (hours * 60 * 60) + (minutes * 60) + seconds
    ### chatGPT 3
    # hours = minutes = seconds = 0
    # time_array = time_string.split(/[hms]/)
    # seconds = time_array.pop.to_i
    # minutes = time_array.pop.to_i unless time_array.empty?
    # hours = time_array.pop.to_i unless time_array.empty?
    # (hours * 60 * 60) + (minutes * 60) + seconds
    ### chatGPT 4
    # regex = /(\d+h)?(\d+m)?(\d+s)?/
    # matches = time_string.match(regex).captures
    # hours = matches[0].to_i
    # minutes = matches[1].to_i
    # seconds = matches[2].to_i
    # total_seconds = hours * 3600 + minutes * 60 + seconds
    # return total_seconds

  end

  def get_video_id(video_url)
    if video_url.include?("?t=") # 時間指定URL
      @seconds = video_url.split("?t=").last
      video_url = video_url.split('?t=').first
    elsif video_url.include?("&t=")
      @seconds = video_url.split("&t=").last.delete("s")
      video_url = video_url.split('&t=').first
    end
    if video_url.include?("&list=") # プレイリストURL
      redirect_to clips_path, alert: "このURLには対応していません。"
      return
    elsif video_url.include?("youtube.com/watch?v=") # URLバー
      video_id = video_url.split("v=").last
    elsif video_url.include?("youtu.be/") # シェア用URL
      video_id = video_url.split("/").last
    elsif video_url.include?("youtube.com/live/") #
      video_id = video_url.split("/").last.split("?").first
    end
    get_video_info(video_id)
  end

  def get_video_info(video_id)
    require 'google/apis/youtube_v3'
    api_key = ENV['YOUTUBE_API_KEY']
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = api_key

    # 動画情報を取得する
    video = youtube.list_videos("snippet", id: video_id).items.first
      @video_id = video_id
    # 投稿日、チャンネル名、チャンネルURLを取得する
    published_at = video.snippet.published_at
    channel_title = video.snippet.channel_title
    channel_url = "https://www.youtube.com/channel/#{video.snippet.channel_id}"
    @published_at = video.snippet.published_at
    @channel_title = video.snippet.channel_title
    @channel_url = "https://www.youtube.com/channel/#{video.snippet.channel_id}"
  end

  def clip_params
    params.require(:clip).permit(:title, :start, :end, :user_id)
    # params.require(:clip).permit(:title, :video_id, :start, :end, :published_at, :channel_id, :user_id)
  end
end
