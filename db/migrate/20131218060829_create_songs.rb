class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.belongs_to :user, index: true
      t.text :sc_id
      t.datetime :song_created_at
      t.text :sc_user_id
      t.integer :duration 
      t.text :sharing
      t.text :embeddable_by
      t.text :genre 
      t.text :title
      t.text :description 
      t.text :uri
      t.text :username
      t.text :permalink
      t.text :iframe_markup
      
      t.timestamps
    end
  end
end
