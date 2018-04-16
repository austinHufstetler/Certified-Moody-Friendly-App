class AddEmailToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :email, :string
  end
end
