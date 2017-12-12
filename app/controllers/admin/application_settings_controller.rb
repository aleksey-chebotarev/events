class Admin::ApplicationSettingsController < Admin::BaseController
  before_action :load_app_config, only: [:edit, :update, :index]

  def update
    if @app_config.update(setting_params)
      flash[:success] = 'Глобальные настройки успешно обновлены.'
      redirect_to admin_application_settings_path
    else
      render :edit
    end
  end

  private

  def load_app_config
    @app_config ||= AppConfig.first
  end

  def setting_params
    params.require(:app_config).permit(:number_of_upcoming_days)
  end
end
