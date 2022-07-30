class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @equipment_listing = EquipmentListing.find(params[:equipment_listing_id])
    @review.equipment_listing = @equipment_listing
    if @review.save
      redirect_to equipment_listing_path(@equipment_listing)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
