class AddPopularityToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :popularity, :integer
  end
end
