class Admin::DashboardController < ApplicationController
	def bookings
		@date = begin
			DateTime.parse(params[:date].to_s)
		rescue => e
			DateTime.now
		end
		byebug
		@date = DateTime.now unless @date.present?
		@orders = Order.where(created_at: @date.beginning_of_day..@date.end_of_day)
	end
end