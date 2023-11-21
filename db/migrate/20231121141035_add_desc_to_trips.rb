class AddDescToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :description, :text
    add_column :trips, :price, :float
  end
end
