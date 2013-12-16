class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.belongs_to :user, index: true
      t.text :provider 
      t.text :uid 

      t.timestamps
    end
  end
end
