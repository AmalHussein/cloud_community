class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.text :commentable_type
      t.integer :commentable_id
      t.datetime :time
      t.boolean :like

      t.timestamps
    end
     add_index :comments, [:commentable_id, :commentable_type]
  end
end




