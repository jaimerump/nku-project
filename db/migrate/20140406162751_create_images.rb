class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.integer :height
      t.integer :width
      t.string :url
      
      t.timestamps
    end
  end
end
