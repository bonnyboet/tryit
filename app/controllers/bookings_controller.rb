class BookingsController < ApplicationController
  def index
    @bookings = Booking.where("status = 'accepted'")
  end

  def show
    @booking = Booking.find(params[:booking_id])
  end

  # def new
  # end

  # def create
  # end

  def requests_index
    @requests_pending = Booking.where("status = 'pending'")
    @requests_denied = Booking.where("status = 'denied'")
  end

  def request_accept
    @booking = Booking.find(params[:booking_id])
    if @booking.status == "pending"
      @booking.update_attribute("status = 'accepted'")
    end

    redirect_to requests_path
  end

  def request_deny
    @booking = Booking.find(params[:booking_id])
    if @booking.status == "pending"
      @booking.update_attribute("status = 'denied'")
    end

    redirect_to requests_path
  end

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
