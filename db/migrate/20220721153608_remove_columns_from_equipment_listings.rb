class RemoveColumnsFromEquipmentListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :equipment_listings, :date, :date
    remove_column :equipment_listings, :start_time, :time
    remove_column :equipment_listings, :end_time, :time
  end
end
