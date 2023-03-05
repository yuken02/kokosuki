class CreateClips < ActiveRecord::Migration[6.1]
  def change
    create_table :clips do |t|
      t.string :title, null: false
      t.integer :video_id, null: false
      t.integer :start
      t.integer :end
      t.datetime :published_at, null: false
      t.string :channel_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
