class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups, id:false do |t|
      t.string :user_id, null: false
      t.integer :group_id, null: false
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
    add_index :user_groups, [:user_id, :group_id]
  end
end
