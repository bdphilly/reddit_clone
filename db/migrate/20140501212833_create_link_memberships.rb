class CreateLinkMemberships < ActiveRecord::Migration
  def change
    create_table :link_memberships do |t|
      t.integer :link_id
      t.integer :sub_id
      t.timestamps
    end
    add_index :link_memberships, [:link_id, :sub_id], unique: true
  end
end
