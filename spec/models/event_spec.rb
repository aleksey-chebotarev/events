require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:region) }
  it { is_expected.to belong_to(:city) }
  it { is_expected.to belong_to(:organizer) }
  it { is_expected.to belong_to(:place) }
  it { is_expected.to delegate_method(:name).to(:city).with_prefix(:city) }
  it { is_expected.to delegate_method(:title).to(:place).with_prefix(:place) }
  it { is_expected.to delegate_method(:address).to(:place).with_prefix(:place) }
  it { is_expected.to delegate_method(:id).to(:organizer).with_prefix(:organizer) }
  it { is_expected.to delegate_method(:title).to(:organizer).with_prefix(:organizer) }
  it { is_expected.to delegate_method(:description).to(:organizer).with_prefix(:organizer) }

  describe '#recent' do
    let!(:event_1) { create :event }
    let!(:event_2) { create :event }

    it 'should order events by created_at DESC' do
      expect(Event.recent).to eq [event_2, event_1]
    end
  end

  describe '#start_event' do
    let!(:event_1) { create :event, start_date: DateTime.now }
    let!(:event_2) { create :event, start_date: DateTime.now + 1 }

    it 'should select event with the specified date' do
      expect(Event.start_event(DateTime.now).first).to eq event_1
    end
  end

  describe '#by_organizer' do
    let!(:event_1) { create :event, organizer: create(:organizer, title: 'Title') }
    let!(:event_2) { create :event, organizer: create(:organizer, title: 'title') }

    it 'should select events with different register of organizer title' do
      expect(Event.by_organizer('TITLE')).to eq [event_1, event_2]
    end
  end

  describe '#by_place' do
    let!(:place_1) { create :event, place: create(:place, title: 'Title') }
    let!(:place_2) { create :event, place: create(:place, title: 'title') }

    it 'should select events with different register of place title' do
      expect(Event.by_place('TITLE')).to eq [place_1, place_2]
    end
  end

  describe '#by_upcoming' do
    let!(:event_1) { create :event, start_date: DateTime.now }
    let!(:event_2) { create :event, start_date: DateTime.now + 1.hours }
    let!(:event_3) { create :event, start_date: DateTime.now + 5.minutes }
    let!(:event_4) { create :event, start_date: DateTime.now + 5.days }
    let!(:event_5) { create :event, start_date: DateTime.now - 1.hours }
    let!(:event_6) { create :event, start_date: DateTime.now - 5.minutes }
    let!(:event_7) { create :event, start_date: DateTime.now - 1.days }

    it 'should select upcoming events' do
      expect(Event.by_upcoming('true')).to eq [event_2, event_3, event_4]
    end

    it 'should select past events' do
      expect(Event.by_upcoming('false')).to eq [event_1, event_5, event_6, event_7]
    end
  end
end
