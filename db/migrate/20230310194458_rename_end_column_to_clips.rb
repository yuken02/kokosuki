class RenameEndColumnToClips < ActiveRecord::Migration[6.1]
  def change
    rename_column :clips, :end, :end_time
  end
end
