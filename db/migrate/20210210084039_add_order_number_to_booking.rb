class AddOrderNumberToBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :booking_number, :string
  end
end
