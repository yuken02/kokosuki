class ClipsController < ApplicationController
  def index
    @clip_new = Clip.new
    @clips = Clip.all

    # require 'google/api_client'
    require 'date'

    @url = params[:url]
    if @url
      if @url.include?("&list=")
        redirect_to clips_path, alert: "このURLには対応していません。"
      elsif @url.include?("youtube.com/watch?v=")
        video_id = @url.split("v=").last
        get_video_info(video_id)
      elsif @url.include?("youtu.be/")
        video_id = @url.split("/").last
        get_video_info(video_id)
      elsif @url.include?("youtube.com/live/")
        video_id = @url.split("/").last.split("?").first
        get_video_info(video_id)
      end
    end
  end

  def create
    # require 'google/apis/youtube_v3'
    # # require 'google/api_client'
    # require 'date'

    # api_key = ENV['YOUTUBE_API_KEY']

    # if url.include?("youtube.com/watch?v=")
    #   video_id = url.split("v=").last
    # elsif url.include?("youtu.be/")
    #   video_id = url.split("/").last
    # elsif url.include?("youtube.com/live/")
    #   video_id = url.split("/").last.split("?").first
    # end

    # youtube = Google::Apis::YoutubeV3::YouTubeService.new
    # youtube.key = api_key

    # # 動画情報を取得する
    # video = youtube.list_videos("snippet", id: video_id).items.first

    # # 投稿日、チャンネル名、チャンネルURLを取得する
    # @published_at = video.snippet.published_at
    # @channel_title = video.snippet.channel_title
    # @channel_url = "https://www.youtube.com/channel/#{video.snippet.channel_id}"
  end


  private

  def get_video_info(video_id)
    require 'google/apis/youtube_v3'
    api_key = ENV['YOUTUBE_API_KEY']
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = api_key

    # 動画情報を取得する
    video = youtube.list_videos("snippet", id: video_id).items.first
      @video_id = video_id
    # 投稿日、チャンネル名、チャンネルURLを取得する
    @published_at = video.snippet.published_at
    @channel_title = video.snippet.channel_title
    @channel_url = "https://www.youtube.com/channel/#{video.snippet.channel_id}"
  end
end
