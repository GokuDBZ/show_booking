class UpdateTables < ActiveRecord::Migration[5.2]
  def change
  	add_column :shows, :seats_left, :integer, default: 20
  	add_column :tickets, :show_id, :integer, foriegn_key: true
  end
end
