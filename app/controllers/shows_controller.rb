class ShowsController < ApplicationController

	def show
		@show = Show.find(params[:id])
		@seat_mapping = {}
		booked_seats = @show.booked_seats
		Ticket.seat_infos.symbolize_keys.each do |seat|
          if booked_seats.include?(seat)
          	@seat_mapping[seat] = 1
          else
          	@seat_mapping[seat] = 0
          end
		end
	end

	def show_seats
		@show = Show.find(params[:id])
		@seat_mapping = {}
		booked_seats = @show.booked_seats 
		Ticket.seat_infos.symbolize_keys.keys.each do |seat|
          if booked_seats.include?(seat)
          	@seat_mapping[seat] ={status: 1, value: Ticket.seat_infos[seat]} 
          else
          	@seat_mapping[seat] =  {status: 0, value: Ticket.seat_infos[seat]} 
          end
		end
	end
end