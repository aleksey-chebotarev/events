require 'rails_helper'

RSpec.describe AppConfig, type: :model do
  it { is_expected.to validate_inclusion_of(:number_of_upcoming_days).in_range(1..3) }

  describe '#single_instance' do
    let!(:app_config_1) { AppConfig.create number_of_upcoming_days: 2}

    it 'when only one instance' do
      expect(AppConfig.count).to eq 1
    end

    context 'when more one instance' do
      let!(:app_config_2) { AppConfig.create number_of_upcoming_days: 2 }

      specify do
        expect(app_config_2.errors.messages).to include(base: ['There can be only one.'])
        expect(AppConfig.count).to eq 1
      end
    end
  end
end
