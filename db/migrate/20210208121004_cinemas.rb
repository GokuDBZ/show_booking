class Cinemas < ActiveRecord::Migration[5.2]
  def change
  	create_table :cinemas do |t|
  		t.string :name, null: false
  		t.text :address, null: false
  	end

  	create_table :screens do |t|
  		t.string :name, null: false
  		t.belongs_to :cinema
  	end
  end
end
