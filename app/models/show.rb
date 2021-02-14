class ::Show < ApplicationRecord
	belongs_to :cinema
	belongs_to :movie
	belongs_to :screen
	has_many :orders, class_name: 'Order', foreign_key: 'show_id'

	enum timing: ["9:30 AM - 12:00 PM", "12 PM - 3 PM", " 3 PM - 6 PM"]

	def booked_seats
		if self.orders.present?
			self.orders.map(&:tickets).flatten.map(&:seat_info).map(&:to_sym)
		else
			[]
		end
	end

	def available_seats
		Ticket.seat_infos.symbolize_keys.keys  - booked_seats
	end
end