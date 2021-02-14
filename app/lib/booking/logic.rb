module Booking
  ROW = [:a, :b, :c, :d]
  COLUMN = 5

  class Logic
    attr_reader :show, :booked_seats, :bookings, :available_seats, :demanded_seats, :errors, :user, :booking 
    attr_accessor :amount_paid
    def initialize(show, user, demanded_seats)
      @show = show
      @user = user
      @bookings = @show.orders
      @booked_seats = get_booked_seats
      @demanded_seats= demanded_seats
      @amount_paid = 0
      @errors = []
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
                              (::Ticket.seat_infos.keys - self.booked_seats).map(&:to_sym)
                             else
                              ::Ticket.seat_infos.keys.map(&:to_sym)
                             end
    end

    def seats_available?
      available_tickets = get_available_tickets
    end

    def all_seats_available?
      demanded_seats.all? {|seat| get_available_seats.include?(seat)}
    end

    def validate
      seats = @demanded_seats.map(&:to_s)
      seats.each do |seat|
      _seat = seat.chars
      unless ROW.include?(_seat[0].to_sym)
        @errors << {message: "Row #{seat[0]} is not available"}
      end
      unless(_seat[1].to_i.between?(1, COLUMN))
        @errors << {message: "Seat #{_seat[1]} is not available in Row #{_seat[0]}"}
      end
     end
    end

    def calculate_price
      seats = @demanded_seats.map(&:to_s)
      
      seats.each do |seat|
        byebug
        self.amount_paid += Ticket::PRICE_MAPPING[Ticket.seat_infos[seat]]
      end
    end

    def valid?
      errors.count == 0
    end

    def create_order
      return nil unless valid?
      if all_seats_available?
        begin
          self.calculate_price 
          ::ApplicationRecord.transaction do
            _booking = ::Order.create(show: show, user_id: self.user.id, amount_paid: self.amount_paid)
            @demanded_seats.each do |seat|
              ::Ticket.create(show_id: show.id, booking_id: _booking.id, seat_info: seat, user_id: self.user.id)
            end
            @show.update_attributes(seats_left: @show.seats_left - @demanded_seats.count)
            @booking = _booking
          end
        rescue => e
          @errors << {message: e.message}
          puts e.backtrace
        end
      else
        @errors << {message: "All seats are not available"}
      end
      
      return @booking
    end
  end
end

# require './app/lib/booking/logic'