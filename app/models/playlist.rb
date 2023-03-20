class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_video, dependent: :destroy

  def playlist_by?(playlist)
    playlist_video.exists?(playlist_id: playlist.id)
  end
end
