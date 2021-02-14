class Ticket < ApplicationRecord
	belongs_to :booking, class_name: "Order", foreign_key: "booking_id"
	belongs_to :user
	belongs_to :show

	enum seat_info: {a1: 11, a2: 12, a3: 13, a4: 14, a5: 15, b1: 21, b2: 22, b3: 23, b4: 24, b5: 25, c1: 31, c2: 32, c3: 33, c4: 34, c5: 35, d1: 41, d2: 42, d3: 43, d4: 44, d5: 45}

	REVERSE_MAPPING = Ticket.seat_infos.to_a.map(&:reverse).to_h
	PRICE_MAPPING = {11 => 200, 12 => 200, 13 => 200, 14 => 200, 15 => 200, 21 => 200, 22 => 200, 23 => 200, 24 => 200, 25 => 200, 31 => 100,  32 => 100, 33 => 100, 34 => 100, 35 => 100,41 => 100, 42 => 100, 43 => 100, 44 => 100, 45 => 100}

end