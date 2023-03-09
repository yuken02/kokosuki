class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :favorites, dependent: :destroy
  has_many :playlist_video, dependent: :destroy
  has_many :tagging, dependent: :destroy
end
