class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def region_is_valid!
    unless cookies[:region_number].present?
      redirect_to root_path
    end
  end
end
