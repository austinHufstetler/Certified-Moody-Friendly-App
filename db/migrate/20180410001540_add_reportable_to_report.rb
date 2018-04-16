class AddReportableToReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :reportable, polymorphic: true
  end
end
