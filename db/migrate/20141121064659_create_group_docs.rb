class CreateGroupDocs < ActiveRecord::Migration
  def change
    create_table :group_docs, id: false do |t|
      t.integer :group_id, null: false
      t.integer :document_id, null: false
      t.belongs_to :group
      t.belongs_to :document

      t.timestamps
    end
    add_index :group_docs, [:group_id, :document_id]
  end
end
