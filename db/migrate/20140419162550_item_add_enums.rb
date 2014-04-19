class ItemAddEnums < ActiveRecord::Migration
  def change
    change_column :items, :availability, :integer, default: 0
    change_column :items, :exclusivity, :integer, default: 0
    change_column :items, :gender, :integer, default: 0
    change_column :items, :packaging_type, :integer, default: 0
  end
end
