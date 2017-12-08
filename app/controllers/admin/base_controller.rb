class Admin::BaseController < ActionController::Base
  layout 'admin/application'

  before_action :access_only_for_admin!

  private

  def access_only_for_admin!
    redirect_to root_path unless user_signed_in? && current_user.has_role?(:admin)
  end
end
