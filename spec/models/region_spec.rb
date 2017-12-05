require 'rails_helper'

RSpec.describe Region, type: :model do
  it { is_expected.to have_many(:cities) }
  it { is_expected.to have_many(:events) }

  describe '.region_is_valid?' do
    let(:region_number) { 25 }
    let!(:region)       { create :region, number: region_number }

    specify do
      expect(Region.region_is_valid?(region_number)).to eq true
    end
  end

  describe 'destroys dependent cities' do
    let!(:region) { create :region, :several_cities }

    specify do
      expect { Region.last.destroy }.to change { City.count }.by(-2)
    end
  end

  describe 'destroys dependent cities' do
    let!(:region) { create :region, :several_events }

    specify do
      expect { Region.last.destroy }.to change { Event.count }.by(-2)
    end
  end
end
