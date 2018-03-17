class CreateMilitaries < ActiveRecord::Migration[5.1]
  def change
    create_table :militaries do |t|
      t.string :name
      t.string :address
      t.string :branch

      t.timestamps
    end
  end
end
