class AddCategoryToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :category, :string
  end
end
