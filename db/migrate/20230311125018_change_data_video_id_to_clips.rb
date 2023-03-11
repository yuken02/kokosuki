class ChangeDataVideoIdToClips < ActiveRecord::Migration[6.1]
  def change
    change_column :clips, :video_id, :string
  end
end