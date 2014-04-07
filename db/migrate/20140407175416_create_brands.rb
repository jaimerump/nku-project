class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.date   :established_on
      t.string :facebook
      t.string :twitter
       
      t.timestamps
    end
    
    add_column :items, :brand_id, :integer
    
  end
end
