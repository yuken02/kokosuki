class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.string :yt_cannel_id, null: false
      
      t.timestamps
    end
  end
end
