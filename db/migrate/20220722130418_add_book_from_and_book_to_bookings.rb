class AddBookFromAndBookToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :book_from, :time
    add_column :bookings, :book_to, :time
  end
end
