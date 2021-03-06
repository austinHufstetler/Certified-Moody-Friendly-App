class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
