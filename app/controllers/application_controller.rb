class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(_resource)
    return admin_events_path if current_user.has_role?(:admin)
    root_path
  end

  def region_is_valid!
    unless cookies[:region_number].present?
      flash[:notice] = 'Вы должны выбрать регион!'
      redirect_to root_path
    end
  end
end
