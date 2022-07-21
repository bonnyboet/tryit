class AddDateStartTimeAndEndTimeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :date, :date
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
  end
end
