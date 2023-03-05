class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.boolean :private, null: false, default: 0

      t.timestamps
    end
  end
end
