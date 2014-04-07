class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   :name
      t.date     :released_on, null: true
      t.decimal  :original_price, null: true
      t.string   :gender
      t.string   :availability
      t.string   :exclusivity
      t.integer  :quantity, null: true
      t.string   :packaging_type
      
      t.timestamps
    end
  end
end
