require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:region) }
  it { is_expected.to belong_to(:city) }
  it { is_expected.to belong_to(:organizer) }
  it { is_expected.to belong_to(:place) }
end
