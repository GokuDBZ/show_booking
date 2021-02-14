class AddDatesInMovies < ActiveRecord::Migration[5.2]
  def change
  	add_column :movies, :release_date, :datetime
  	add_column :movies, :end_date, :datetime
  end
end
