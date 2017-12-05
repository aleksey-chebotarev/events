require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:region_number) { 25 }
  let!(:region) { create :region, number: region_number }

  before { cookies[:region_number] = region_number }

  describe '#index' do
    context 'should get collection of events with filters' do
      let(:start_event) { DateTime.now + 1 }
      let!(:event) do
        create_list :event, 2,
                    region: region,
                    start_date: start_event,
                    organizer:  create(:organizer, title: 'Organizer'),
                    place:      create(:place, title: 'Place')
      end

      let(:params) do
        {
          start_event: start_event,
          by_organizer: 'Organizer',
          by_place:     'Place',
          by_upcoming:  'true'
        }
      end

      before { get :index, params: params }

      specify do
        expect(assigns(:events)).to eq [Event.last, Event.first]
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
    let!(:event) { create(:event, region: region) }

    before { get :show, params: { id: event.id } }

    specify do
      expect(assigns(:event)).to eq event
    end
  end
end
