class AddAccountableToAccount < ActiveRecord::Migration[5.1]
  def change
    add_reference :accounts, :accountable, polymorphic: true
  end
end
