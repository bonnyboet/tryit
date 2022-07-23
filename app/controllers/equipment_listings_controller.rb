class EquipmentListingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
    @equipment_listings = EquipmentListing.all
  end

  def show
    @equipment_listing_id = params[:id]
    @equipment_listing = EquipmentListing.find(@equipment_listing_id)

    # if @equipment_listing.nil?
    #   @equipment_listing_id = params[:id]
    # end
  rescue ActiveRecord::RecordNotFound
  end

  def new
    @equipment_listing = EquipmentListing.new
  end

  def create
    @user_id = current_user.id
    @equipment_listing = EquipmentListing.new(listing_params)
    @equipment_listing.user_id = @user_id
    if @equipment_listing.save
      redirect_to equipment_listing_path(@equipment_listing)
    else
      render new
    end
  end

  def update
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
  end

  def edit
    @equipment_listing = EquipmentListing.find(params[:equipment_id])
  end

  private

  def listing_params
    params.require(:equipment_listing).permit(:name, :description, :category, :hourly_rate, :available, :photo, :address)
  end

  def record_not_found
  end
end
