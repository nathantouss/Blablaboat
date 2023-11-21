class ChangingTimeOfArrrivalColumnInTrips < ActiveRecord::Migration[7.1]
  def change
    remove_column :trips, :time_of_arrrival
    add_column :trips, :time_of_arrival, :date
  end
end
