class AddBirthdayToUsers < ActiveRecord::Migration
  def change
  	add_column :users , :cc_birthday_day, :integer 
  	add_column :users, 	:cc_birthday_month, :integer
  end
end
