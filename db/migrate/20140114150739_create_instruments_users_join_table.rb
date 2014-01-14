class CreateInstrumentsUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :instruments_users do |t|
  		t.belongs_to :user 
  		t.belongs_to :instrument 
  	end 
  end
end
