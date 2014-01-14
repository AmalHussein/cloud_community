class AddBirthdayToUsers < ActiveRecord::Migration
  def change
  	add_column :users , :cc_birthday_day, :integer 
  	add_column :users, 	:cc_birthday_month, :integer
  	remove_column :users, :cc_birthday

  end
end
