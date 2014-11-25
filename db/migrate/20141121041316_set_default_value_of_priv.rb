class SetDefaultValueOfPriv < ActiveRecord::Migration
  
  def self.up
    change_column :users, :privilege, :integer, default: 3
  end

  def self.down
    change_column :users, :privilege, :integer, default: nil
  end

end
