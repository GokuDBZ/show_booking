class AddTimestampsToTables < ActiveRecord::Migration[5.2]
  def change
  	ActiveRecord::Base.connection.tables.each do |table_name|
  		next if ["ar_internal_metadata","schema_migrations", "users"].include?(table_name)

  		change_table table_name.to_sym do |t|
      		t.timestamps
    	end
  	end
  end
end
