class AddCoordinatesToEquipmentListings < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_listings, :latitude, :float
    add_column :equipment_listings, :longitude, :float
  end
end
