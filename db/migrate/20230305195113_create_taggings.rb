class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.integer :clip_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
