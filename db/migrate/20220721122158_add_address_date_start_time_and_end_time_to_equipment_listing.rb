class AddAddressDateStartTimeAndEndTimeToEquipmentListing < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_listings, :address, :string
    add_column :equipment_listings, :date, :date
    add_column :equipment_listings, :start_time, :time
    add_column :equipment_listings, :end_time, :time
  end
end
