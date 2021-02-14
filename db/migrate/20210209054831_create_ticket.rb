class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
    	t.belongs_to :booking
    	t.belongs_to :user
    	t.integer :seat_info
    end
  end
end
