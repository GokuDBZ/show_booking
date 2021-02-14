class MoviesController < ApplicationController
	def shows
		movie_id = params[:id]
		@shows = Show.where(movie_id: movie_id)
	end

	def index
		@movies = Movie.all
	end
end
