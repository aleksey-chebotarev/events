class Event < ApplicationRecord
  include Filterable

  mount_uploader :cover, CoverUploader

  belongs_to :region
  belongs_to :city
  belongs_to :organizer
  belongs_to :place

  scope :recent, -> { order(created_at: :desc) }
  scope :start_event, ->(start_event) { where('DATE(start_date) = ?', start_event) }
  scope :by_organizer, ->(organizer) { joins(:organizer).where('lower(organizers.title) LIKE ?', "%#{organizer.downcase}%") }
  scope :by_place, ->(place) { joins(:place).where('lower(places.title) LIKE ?', "%#{place.downcase}%") }
  scope :by_upcoming, ->(var) {
    if var == 'true'
      where('start_date >= ?', DateTime.now)
    else
      where('start_date <= ?', DateTime.now)
    end
  }

  delegate :name, to: :city, prefix: 'city', allow_nil: true
  delegate :title, :address, to: :place, prefix: 'place', allow_nil: true
  delegate :id, :title, :description, to: :organizer, prefix: 'organizer', allow_nil: true
end
