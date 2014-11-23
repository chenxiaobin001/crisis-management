class CreateGroupDocs < ActiveRecord::Migration
  def change
    create_table :group_docs do |t|
      t.integer :group_id
      t.integer :document_id
      t.belongs_to :group_doc
      t.belongs_to :group

      t.timestamps
    end
  end
end
