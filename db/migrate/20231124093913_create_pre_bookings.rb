class CreatePreBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :pre_bookings do |t|
      t.integer :number_of_people
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
