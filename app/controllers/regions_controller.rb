class RegionsController < ApplicationController
  def update
    if params[:region_number].present? && Region.region_is_valid?(params[:region_number])
      cookies[:region_number] = params[:region_number]
    else
      flash[:error] = 'Region is invalid'

      redirect_to root_path
    end
  end
end
