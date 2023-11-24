class AddCommentToPreBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :pre_bookings, :comment, :text
  end
end
