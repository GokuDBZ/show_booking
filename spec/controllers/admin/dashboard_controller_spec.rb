require "rails_helper"

RSpec.describe Admin::DashboardController, :type => :controller do
  context "Cinema with 2 screens" do

  	before(:each) do
    	@movie = Movie.create({name: 'Wonder Woman', genre: "Scifi"})
    	@cinema = Cinema.create({name: 'Cine Polis', address: "asdasd"})
    	@screen = Screen.create({name: "CP-1", cinema_id: @cinema.id})

    	@show = Show.create({movie_id: @movie.id, cinema_id: @cinema.id, screen_id: @screen.id})
    	@booking = Order.create({show_id: @show.id,amount_paid: 200})
    end

	  describe "GET #bookings" do
	    # it "renders the bookings template" do
	    #   controller.stub(:authenticate_user!).and_return(true)
	    #   controller.stub(:current_user).and_return(User.create({email: "asdsad@gmail.com", password: "password"}))
	    #   subject { get :bookings }
	    #   expect(subject).to render_template(:bookings)
	    #   expect(subject).to render_template("bookings")
	    # end
	  end
  end
end

