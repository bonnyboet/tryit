class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    @bookings = Booking.where(user: current_user)
  end

  def index_in
    bookings = []
    listings = EquipmentListing.where(user: current_user)
    listings.each do |listing|
      listing.bookings.each do |booking|
        bookings << booking
      end
    end
    @bookings = bookings
  end

  def new
    @equipment_listing = EquipmentListing.find(params[:equipment_listing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @equipment_listing = EquipmentListing.find(params[:equipment_listing_id])
    @booking.equipment_listing = @equipment_listing
    @booking.book_from = booking_params[:book_from] # params[:book_from]
    @booking.book_to = booking_params[:book_to] # params[:book_to]
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path # /bookings ... BookingsController#index
    else
      render :new
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
    params.require(:booking).permit(:status, :user_id, :equipment_listing_id, :book_from, :book_to)
  end
end
