class AddApprovedToAccount < ActiveRecord::Migration[5.1]
  def self.up
    add_column :accounts, :approved, :boolean, :default => false, :null => false
    add_index  :accounts, :approved
  end

  def self.down
    remove_index  :accoutns, :approved
    remove_column :accounts, :approved
  end
end
