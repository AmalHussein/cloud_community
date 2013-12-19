class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.belongs_to :user
    	t.text :unique_id
    	t.text :description 
    	t.text :author 
    	t.text :thumbnail 
    	t.boolean :embeddable
    	t.integer :duration 
    	t.text :title
    	t.datetime :published_at
      t.text :view_status, default: "private"
      t.text :icon
      t.text :youtube_iframe

      t.timestamps
    end
  end
end
