class CreateShow < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
    	t.belongs_to :movie
    	t.belongs_to :cinema
    	t.belongs_to :screen
    	t.belongs_to :user
    	t.integer :timing
    end
  end
end
