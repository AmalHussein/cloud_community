class CreateUsersInstrumentsJoinTable < ActiveRecord::Migration
  def change
  	create_table :users_intruments, id: false do |t|
  		t.integer :user_id
  		t.integer :instrument_id
  	end 
  	add_index :users_intruments, :user_id
  	add_index :users_intruments, :instrument_id
  	add_index :users_intruments, [:user_id, :instrument_id]
  end
end



