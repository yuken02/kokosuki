class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :favorites, dependent: :destroy
  has_many :playlist_video, dependent: :destroy
  has_many :tagging, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def playlist_by?(user)
    playlist_video.exists?(user_id: user.id)
  end
end
