class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pennkey
      t.string :email
      t.string :school
      t.integer :privilege
      t.string :password_hash

      t.timestamps
    end
  end
end
