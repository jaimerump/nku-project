class AddColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :uploaded_url, :string
  end
end
