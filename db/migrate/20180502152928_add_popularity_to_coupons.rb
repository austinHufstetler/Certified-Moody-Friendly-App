class AddPopularityToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :popularity, :integer, default: 0
  end
end
