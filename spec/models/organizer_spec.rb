require 'rails_helper'

RSpec.describe Organizer, type: :model do
  it { is_expected.to have_many(:events) }
end
