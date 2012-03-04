class AddIndexToContentBlocks < ActiveRecord::Migration
  def change
    add_index :content_blocks, :slug, unique: true
  end
end
