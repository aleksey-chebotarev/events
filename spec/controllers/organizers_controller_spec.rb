require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do
  let(:region_number) { 25 }
  let!(:region) { create :region, number: region_number }

  before { cookies[:region_number] = region_number }

  describe '#index' do
    context 'should get collection of organizers' do
      let!(:organizers) { create_list :organizer, 3 }

      before { get :index, params: { page: 1, per_page: 2 } }

      specify do
        expect(assigns(:organizers).size).to eq 2
      end
    end

    context 'when region is invalid' do
      before do
        cookies[:region_number] = nil
        get :index
      end

      specify do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe '#show' do
    let(:organizer) { create :organizer }
    let!(:events)   { create_list :event, 2, organizer: organizer }

    before { get :show, params: { id: organizer.id } }

    specify do
      expect(assigns(:events)).to eq [Event.last, Event.first]
    end
  end
end
