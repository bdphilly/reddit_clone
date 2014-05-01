class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :text
      t.integer :submitter_id, null: false

      t.timestamps
    end
    add_index :links, :url
    add_index :links, :submitter_id
    add_index :links, :title
  end
end
