class Order < ApplicationRecord
	self.table_name = "bookings"
	before_create :set_booking_number
	
	belongs_to :show
	has_many :tickets, class_name: "Ticket", foreign_key: "booking_id"

	def set_booking_number
      self.booking_number = SecureRandom.hex(10)
	end
end