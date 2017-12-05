class Region < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :events, dependent: :destroy

  def self.region_is_valid?(region_number)
    exists?(number: region_number)
  end
end
