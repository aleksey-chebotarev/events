class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    current_user.has_role?(:admin) ? admin_events_path : root_path
  end

  def region_is_valid!
    unless cookies[:region_number].present?
      redirect_to root_path
    end
  end
end
