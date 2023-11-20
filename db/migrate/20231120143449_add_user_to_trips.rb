class AddUserToTrips < ActiveRecord::Migration[7.1]
  def change
    add_reference :trips, :user, foreign_key: true
  end
end
