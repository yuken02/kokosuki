class RenameYtCannelIdColumnToChannels < ActiveRecord::Migration[6.1]
  def change
    rename_column :channels, :yt_cannel_id, :yt_channel_id
  end
end
