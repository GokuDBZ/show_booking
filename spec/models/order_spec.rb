require "rails_helper"

RSpec.describe Order, :type => :model do
  context "Cinema with 2 screens" do
    it "create cinemas" do
        movie = Movie.create({name: 'Wonder Woman', genre: "Scifi"})
    	cinema = Cinema.create({name: 'Cine Polis', address: "asdasd"})
    	screen = Screen.create({name: "CP-1", cinema_id: cinema.id})

    	show = Show.create({movie_id: movie.id, cinema_id: cinema.id, screen_id: screen.id})
    	booking = Order.create({show_id: show.id,amount_paid: 200})

    	expect(booking.show.movie.name).to eq('Wonder Woman')
    	expect(booking.amount_paid).to eq(200)
    end
  end
end