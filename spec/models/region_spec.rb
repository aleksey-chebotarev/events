require 'rails_helper'

RSpec.describe Region, type: :model do
  it { is_expected.to have_many(:cities) }
  it { is_expected.to have_many(:events) }
end
