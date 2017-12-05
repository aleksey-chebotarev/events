require 'rails_helper'

RSpec.describe SubscribesController, type: :controller do
  describe '#create' do
    context 'when success' do
      let(:params) { { email: 'email@example.com' } }

      before { post :create, params: params }

      specify do
        expect(flash[:success]).to match 'Вы подписаны на рассылку'
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when failure' do
      let(:params) { { email: 'email@' } }

      before { post :create, params: params }

      specify do
        expect(flash[:error]).to eq 'email is invalid'
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
