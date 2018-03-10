class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
