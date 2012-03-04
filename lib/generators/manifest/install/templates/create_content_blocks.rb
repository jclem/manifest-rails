class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.integer :page_id
      t.boolean :allow_html, default: false

      t.timestamps
    end
  end
end
