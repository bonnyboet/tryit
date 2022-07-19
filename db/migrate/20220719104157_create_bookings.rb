class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :status, default: "pending"
      t.references :user, null: false, foreign_key: true
      t.references :equipment_listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
