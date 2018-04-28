class AddExpirationToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :expiration, :date, :default => (Date.today + 1.year)
  end
end
