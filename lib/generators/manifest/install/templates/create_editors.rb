class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
