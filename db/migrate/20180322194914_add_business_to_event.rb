class AddBusinessToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :business, foreign_key: true
  end
end
