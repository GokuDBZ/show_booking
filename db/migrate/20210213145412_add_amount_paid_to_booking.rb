class AddAmountPaidToBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :amount_paid, :decimal
  end
end
