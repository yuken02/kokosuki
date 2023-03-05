class CreatePlaylistVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_videos do |t|
      t.integer :playlist_id, null: false
      t.integer :clip_id, null: false

      t.timestamps
    end
  end
end
