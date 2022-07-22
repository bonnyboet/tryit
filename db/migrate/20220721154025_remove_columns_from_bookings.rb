class RemoveColumnsFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :date, :date
    remove_column :bookings, :start_time, :time
    remove_column :bookings, :end_time, :time
  end
end
