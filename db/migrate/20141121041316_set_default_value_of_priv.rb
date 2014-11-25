class SetDefaultValueOfPriv < ActiveRecord::Migration
  
  def self.up
    change_column :users, :privilege, :integer, default: 0
  end

  def self.down
    change_column :users, :privilege, :integer, default: nil
  end

end
