class RenameStartColumnToClips < ActiveRecord::Migration[6.1]
  def change
    rename_column :clips, :start, :start_t
  end
end
