class PlaylistVideo < ApplicationRecord
  belongs_to :playlist
  belongs_to :clip
end
