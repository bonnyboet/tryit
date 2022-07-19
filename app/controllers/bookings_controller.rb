class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:booking_id])
  end

  # def new
  # end

  # def create
  # end

  def update
    @booking = Booking.find(params[:booking_id])
  end

  def edit
    @booking = Booking.find(params[:booking_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :listing_id)
  end
end
