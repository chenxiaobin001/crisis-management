class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pennkey
      t.string :password_hash
      t.string :password_salt
      t.integer :level

      t.timestamps
    end
  end
end
