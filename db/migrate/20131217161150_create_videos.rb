class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.text :unique_id
    	t.text :description 
    	t.text :author 
    	t.text :thumbnail 
    	t.boolean :embeddable
    	t.integer :duration 
    	t.text :title
    	t.datetime :published_at

      t.timestamps
    end
  end
end
