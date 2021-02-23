class Admin::DashboardController < ApplicationController
	before_action :require_admin

	def bookings
		@date = begin
			DateTime.parse(params[:date].to_s)
		rescue => e
			DateTime.now
		end
		@date = DateTime.now unless @date.present?
		@orders = Order.where(created_at: @date.beginning_of_day..@date.end_of_day)
	end

	private
	def require_admin
		unless current_user.admin?
			redirect_to root_path, notice: "You are not an admin"
		end
	end
end