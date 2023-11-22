class AddCoordinatesToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :origin_latitude, :float
    add_column :trips, :origin_longitude, :float
    add_column :trips, :destination_latitude, :float
    add_column :trips, :destination_longitude, :float
  end
end
