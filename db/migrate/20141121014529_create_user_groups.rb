class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups, id:false do |t|
      t.string :pennkey
      t.integer :group_id
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
  end
end
