class AddCountToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :count, :integer, :default => 0
  end
end
