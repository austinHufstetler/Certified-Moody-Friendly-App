class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :logo_url
      t.text :description

      t.timestamps
    end
  end
end
