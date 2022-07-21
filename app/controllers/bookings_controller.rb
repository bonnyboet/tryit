class BookingsController < ApplicationController
  def index
    @bookings = Booking.where("status = 'accepted'")
  end

  def show
    @booking = Booking.find(params[:booking_id])
  end

  def new
    @equipment_listing = EquipmentListing.find(params[:equipment_listing_id])
    @booking = Booking.new
  end

  def create
    @equipment_listing = EquipmentListing.find(params[:equipment_listing_id])
    @booking = Booking.new(booking_params)
    @booking.equipment_listing = @equipment_listing
    @booking.user = current_user
    if @booking.save
      redirect_to equipment_listing_bookings_path(@booking)
    else
      redirect_to equipment_listing_path(@equipment_listing)
    end
  end

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
