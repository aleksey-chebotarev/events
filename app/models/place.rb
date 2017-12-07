class Place < ApplicationRecord
  has_many :events

  validates :title, :address, presence: true
end
