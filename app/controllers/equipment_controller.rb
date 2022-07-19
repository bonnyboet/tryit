class EquipmentController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:equipment_id])
  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @equipment = Equipment.find(params[:equipment_id])
    @booking.equipment = @equipment
    @booking.save
    @restaurant.save
    redirect_to equipment_path(@equipment)
  end

  def update
    @equipment = Equipment.find(params[:equipment_id])
  end

  def edit
    @equipment = Equipment.find(params[:equipment_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :listing_id)
  end
end
