class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
    	t.text :level
      t.timestamps
    end
  end
end
