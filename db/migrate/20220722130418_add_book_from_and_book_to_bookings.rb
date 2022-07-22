class AddBookFromAndBookToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :book_from, :datetime
    add_column :bookings, :book_to, :datetime
  end
end
