class RenameStartTColumnToClips < ActiveRecord::Migration[6.1]
  def change
    rename_column :clips, :start_t, :start_time
  end
end
