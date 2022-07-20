class EquipmentListingsController < ApplicationController
  def index
    @equipments = EquipmentListing.all
  end

  def show
    @equipment = EquipmentListing.find(params[:id])
  end

  def new
    @equipment = EquipmentListing.find(params[:equipment_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @equipment = EquipmentListing.find(params[:equipment_id])
    @booking.equipment = @equipment
    @booking.save
    @restaurant.save
    redirect_to equipment_path(@equipment)
  end

  def update
    @equipment = EquipmentListing.find(params[:equipment_id])
  end

  def edit
    @equipment = EquipmentListing.find(params[:equipment_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :listing_id)
  end
end
