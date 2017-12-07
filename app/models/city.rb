class City < ApplicationRecord
  belongs_to :region
  has_many :events

  validates :name, uniqueness: true, presence: true
end
