class AddFblinkToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :fblink, :string
  end
end
