# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


   # movies = Movie.create([{name: 'Wonder Woman', genre: "Scifi"}, {name: 'Anabelle', genre: "Horror"}, {name: 'Tenet', genre: "Scifi"}, {name: "DDLJ", genre: "RomCom"}, {name: "Durgamati", genre: "Thriller"}, {name: "Avengers", genre: "Scifi"}])

   # cinemas = Cinema.create([{name: "Cine Polis", address: "Logix Mall, City Center Noida"}, {name: "Wave Cinemas", address: "Wave Cinemas, Noida"}, {name: "PVR Cinema", address: "GIP Mall, Noida"}])

   # screens = {}
   # movies = Movie.all
   # Cinema.all.to_a.each_with_index do |cinema, index|
   # 	cin_name = cinema.name.split(" ").map{|n| n[0]}.join("")
   # 	run = 1
   # 	while(run <= 2) do
   # 		if screens.has_key?(cinema.name)
   # 		  screens[cinema.name] << Screen.create(name: cin_name + "-" + run.to_s , cinema: cinema)
   # 	    else
   # 		  screens[cinema.name] = [Screen.create(name: cin_name + "-" + run.to_s , cinema: cinema)]
   # 	    end
   # 	    run += 1 
   # 	end
   # end


   # Show.create(movie: Movie.first, cinema: Cinema.first, screen: Screen.first, timing: Show.timings.first)
   # Show.create(movie: Movie.second, cinema: Cinema.first, screen: Screen.second, timing: 1)
   
   movies = Movie.all.reverse

   # Show.create(movie: movies.first, cinema: Cinema.where(name: "Wave Cinemas").first, screen: Cinema.where(name: "Wave Cinemas").first.screens[1], timing: 1)
   # Show.create(movie: movies.first, cinema: Cinema.where(name: "PVR Cinema").first, screen: Cinema.where(name: "PVR Cinema").first.screens[1], timing: 0)

   Show.create(movie: movies.second, cinema: Cinema.where(name: "Wave Cinemas").first, screen: Cinema.where(name: "Wave Cinemas").first.screens[0], timing: 2)
   Show.create(movie: movies.second, cinema: Cinema.where(name: "Cine Polis").first, screen: Cinema.where(name: "Cine Polis").first.screens[1], timing: 1)
   Show.create(movie: movies.second, cinema: Cinema.where(name: "PVR Cinema").first, screen: Cinema.where(name: "PVR Cinema").first.screens[0], timing: 0)

   Show.create(movie: movies.second, cinema: Cinema.where(name: "Wave Cinemas").first, screen: Cinema.where(name: "Wave Cinemas").first.screens[0], timing: 2)
   Show.create(movie: movies.second, cinema: Cinema.where(name: "Cine Polis").first, screen: Cinema.where(name: "Cine Polis").first.screens[1], timing: 0)
   Show.create(movie: movies.second, cinema: Cinema.where(name: "PVR Cinema").first, screen: Cinema.where(name: "PVR Cinema").first.screens[0], timing: 1)
   

