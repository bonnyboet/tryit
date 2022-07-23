class EquipmentListingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    @equipment_listings = EquipmentListing.all
  end

  def show
    @equipment_listing_id = params[:id]
    @equipment_listing = EquipmentListing.find(@equipment_listing_id)
    @booking = Booking.new

    # if @equipment_listing.nil?
    #   @equipment_listing_id = params[:id]
    # end
  rescue ActiveRecord::RecordNotFound
  end

  def new
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
    @booking.equipment = @equipment
    @booking.save
    redirect_to equipment_path(@equipment)
  end

  def update
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
  end

  def edit
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :listing_id)
  end

  def record_not_found
  end
end
