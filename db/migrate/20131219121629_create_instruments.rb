class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
    	t.text :name
    	t.text :image_icon
    	t.text :hover_icon 
    	t.text :description

      t.timestamps
    end
  end
end
