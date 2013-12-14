class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :username
    	t.text :email
    	t.text :first_name 
    	t.text :last_name
    	t.string :birthday
    	t.string :zip_code
      t.text :provider
      t.text :uid
      t.timestamps
    end
  end
end
