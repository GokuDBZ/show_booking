require "rails_helper"

RSpec.describe Cinema, :type => :model do
  context "Cinema with 2 screens" do
    it "create cinemas" do
      cinema = Cinema.create!({name: "GIP ", address: "xyz"})
      screen1 = cinema.screens.create!({name: "P1"})
      screen2 = cinema.screens.create!({name: "P2"})
      expect(cinema.reload.screens).to eq([screen1, screen2])
    end
  end
end