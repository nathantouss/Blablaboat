class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.date :time_of_departure
      t.date :time_of_arrrival
      t.integer :number_of_people

      t.timestamps
    end
  end
end
