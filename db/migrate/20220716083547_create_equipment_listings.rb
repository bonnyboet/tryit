class CreateEquipmentListings < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_listings do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :hourly_rate
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
