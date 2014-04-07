class CreateUsersItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.integer  :user_id
      t.integer  :item_id
      t.integer  :shelf_id, null: true 
      t.string   :status
      t.string   :gender, null: true
      
      t.timestamps
    end
  end
end