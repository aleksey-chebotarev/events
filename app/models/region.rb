class Region < ApplicationRecord
  has_many :cities
  has_many :events
end
