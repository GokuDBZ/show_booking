module Ticket
  ROW = [:a, :b, :c, :d]
  COLUMN = 5

  class Logic
  	attr_reader :show, :booked_seats, :bookings, :available_seats, :demanded_seats
  	
  	def initialize(show, demanded_seats)
  		@show = show
  		@bookings = show.bookings
  		@booked_seats = get_booked_seats
  		@demanded_seats= demanded_seats
  		validate
  	end

  	def get_booked_seats
  		if @bookings.present?
  		 @bookings.map(&:tickets).flatten.map(&:seat_info)
  		else
  			[]
  		end
  	end

  	def get_available_seats
  		@available_tickets ||= if @bookings.present?
  			                      ::Ticket.seat_infos.keys -self.booked_seats
  		                       else
  			                      ::Ticket.seat_infos.keys
  		                       end
  	end

  	def seats_available?
  		available_tickets = get_available_seats



  	end

  	def all_seats_available?
      demanded_seats.all? {|seat| get_available_seats.include?(seat)}
  	end

  	def validate

  	end
  end
end