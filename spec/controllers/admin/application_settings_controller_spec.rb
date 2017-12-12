require 'rails_helper'

RSpec.describe Admin::ApplicationSettingsController, type: :controller do
  let(:user) { create :user, :as_admin }

  before { sign_in(user) }

  describe '#update' do
    let(:number_of_upcoming_days) { 1 }
    let!(:app_config) { AppConfig.create number_of_upcoming_days: number_of_upcoming_days }

    context 'when success' do
      let(:params) { { id: app_config.id, app_config: { number_of_upcoming_days: 2 } } }

      before { put :update, params: params }

      it 'should update record and redirect to app settings page' do
        expect(app_config.reload.number_of_upcoming_days).to eq 2
        expect(response).to redirect_to admin_application_settings_path
        expect(assigns(:app_config)).to be_an_instance_of AppConfig
        expect(flash[:success]).to match 'Глобальные настройки успешно обновлены.'
      end
    end

    context 'when failure' do
      let(:params) { { id: app_config.id, app_config: { number_of_upcoming_days: 4 } } }

      before { put :update, params: params }

      it 'should update record with invalid data and render edit action' do
        expect(app_config.reload.number_of_upcoming_days).to eq number_of_upcoming_days
        expect(response).to render_template :edit
      end
    end
  end
end
