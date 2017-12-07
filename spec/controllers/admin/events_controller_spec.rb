require 'rails_helper'

RSpec.describe Admin::EventsController, type: :controller do
  let(:user) { create :user, :as_admin }

  before { sign_in(user) }

  describe '#index' do
    context 'should get collection of events' do
      let!(:event_1) { create :event }
      let!(:event_2) { create :event }
      let!(:event_3) { create :event }

      before { get :index, params: { page: 1, per_page: 2 } }

      specify do
        expect(assigns(:events)).to eq [event_3, event_2]
      end
    end
  end

  describe '#new' do
    before { get :new }

    it 'build a place' do
      expect(assigns(:event)).to be_a_new(Event)
    end

    it 'build a place on event' do
      expect(assigns(:event).place).to be_a_new(Place)
    end
  end

  describe '#create' do
    context 'when success' do
      let!(:region)    { create :region }
      let!(:city)      { create :city }
      let!(:organizer) { create :organizer }

      let(:params) do
        {
          event: {
                   title:         'title',
                   description:   'description',
                   start_date:    DateTime.now + 3.days,
                   cover:         fixture_file_upload('pixel.png', 'image/png'),
                   external_link: 'http://example.com',
                   region_id:     region.id,
                   city_id:       city.id,
                   organizer_id:  organizer.id,
                   place_attributes: {
                                       title:   'title',
                                       address: 'address'
                                     }
                  }
        }
      end

      before { post :create, params: params }

      it 'should redirect to events list' do
        expect(response).to redirect_to admin_events_path
        expect(flash[:success]).to match 'Мероприятие успешно создано.'
      end
    end

    context 'when failure' do
      let(:params) { { event: { title: '' } } }

      before { post :create, params: params }

      it 'render form with invalid data' do
        expect(assigns(:event)).to be_an_instance_of Event
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    context 'when request is not ajax' do
      let!(:event) { create :event, title: 'Title' }

      context 'when success' do
        let(:params) { { id: event.id, event: { title: 'New title' } } }

        before { put :update, params: params }

        it 'should update record and redirect to events list' do
          expect(event.reload.title).to eq 'New title'
          expect(response).to redirect_to admin_events_path
          expect(assigns(:event)).to be_an_instance_of Event
          expect(flash[:success]).to match 'Мероприятие успешно изменено.'
        end
      end

      context 'when failure' do
        let(:params) { { id: event.id, event: { title: '' } } }

        before { put :update, params: params }

        it 'should update record with invalid data and render edit action' do
          expect(event.reload.title).to eq 'Title'
          expect(response).to render_template :edit
        end
      end
    end

    context 'when request is ajax' do
      let(:cities)  { create_list :city, 2 }
      let(:event)   { create :event }
      let!(:region) { create :region, cities: cities }

      before { put :update, xhr: true, params: { id: event.id, region_id: region.id } }

      it 'should update cities list of region via ajax' do
        expect(assigns(:cities)).to eq(cities)
        expect(assigns(:event)).to eq(event)
        expect(response.code).to eq '200'
      end
    end
  end
end
