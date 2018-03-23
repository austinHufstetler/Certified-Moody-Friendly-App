class AddBusinessToCoupon < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :business, foreign_key: true
  end
end
