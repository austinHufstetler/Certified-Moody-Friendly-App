class CreateChambers < ActiveRecord::Migration[5.1]
  def change
    create_table :chambers do |t|
      t.string :address

      t.timestamps
    end
  end
end
