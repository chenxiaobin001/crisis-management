class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :pennkey, id:false do |t|
      t.string :pennkey
      t.string :email
      t.string :school
      t.integer :privilege
      
      t.timestamps
    end
  end
end
