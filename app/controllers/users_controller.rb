class UsersController < ApplicationController
  def my_listing
    raise
  end

  def show
    if current_user.nil?
      # need to signup
      redirect_to new_user_registration_path
    else
      @current_user_id = current_user.id
      @current_user_id = rand(1..9)
      @my_equipmentListings = EquipmentListing.where(user_id: @current_user_id)
      raise
    end
  end
end
