class BookingsController < ApplicationController
	skip_before_action :verify_authenticity_token
    #before_action :validate_request, only: [:create]


    def index
    end

    def show
    	@booking = Order.find(params[:id])
    end

	def create
		show_id = params[:show_id]
		requested_seats = params[:requested_seats]
        message = nil
        status = nil
        @booking_id = nil
		if !show_id.present? || !requested_seats.present?
			message = ["Show or Seats are missing"]
			status = 422
		elsif show_id.present? && requested_seats.present?
			requested_seats = requested_seats.map do |seat| Ticket::REVERSE_MAPPING[seat.to_i] end.map(&:to_sym)
			@booking = Booking::Logic.new(Show.find(show_id), current_user, requested_seats)
			@booking.create_order

			if @booking.booking.present?
				@booking_id = @booking.booking.id
				status = 200
			else
				message = @booking.errors.map{|error| error[:message]}
				status = 422
			end		
		end
			
		render json: {message: message, booking_id: @booking_id, status: status}
	end


end
