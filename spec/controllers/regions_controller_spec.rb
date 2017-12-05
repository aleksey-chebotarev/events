require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  describe '#update' do
    let(:region_number) { '25' }
    let!(:region) { create :region, number: region_number }

    before { put :update, params: params }

    context 'when success' do
      let(:params) { { region_number: region_number } }

      specify do
        expect(response.cookies['region_number']).to eq(region_number)
      end
    end

    context 'when failure' do
      let(:params) { { region_number: '' } }

      specify do
        expect(response).to redirect_to root_path
        expect(flash[:error]).to match 'Region is invalid'
      end
    end
  end
end
