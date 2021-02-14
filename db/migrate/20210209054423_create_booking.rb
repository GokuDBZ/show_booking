class CreateBooking < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.belongs_to :show
    	t.belongs_to :user
    end
  end
end
