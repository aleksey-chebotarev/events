class Organizer < ApplicationRecord
  has_many :events

  validates :title, :description, presence: true
end
