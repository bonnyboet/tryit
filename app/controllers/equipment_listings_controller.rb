class EquipmentListingsController < ApplicationController
  def index
    @equipment_listings = EquipmentListing.all
  end

  def show
    @equipment_listing = EquipmentListing.find(params[:id])
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
end
